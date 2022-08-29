# Syfala project

Automatic compilation of Faust programs onto the Zybo-Z7 FPGA. 

## Dependencies

Please follow the instructions in the file [doc/dependencies.md](doc/dependencies.md) in order to install the **Xilinx** **toolchain** and various other dependencies.

## Installing

`$ ./syfala.tcl --install` will install a symlink in /usr/bin. After this you'll be able to just run: 

`$ syfala myfaustprogram.dsp` 

You'll also have to **edit** your shell **resource** **file** (~/.**bashrc** / ~/.**zshrc**) and set the following environment variable: 

```shell
export XILINX_ROOT_DIR=/my/path/to/Xilinx/root/directory
```

`XILINX_ROOT_DIR` is the root directory where all of the Xilinx tools (Vivado, Vitis, Vitis_HLS) are installed.

**Note:** the `use_vitis` function used in previous versions of syfala is not required anymore.

## Quick start

Running syfala (all steps) on a .dsp file and export the build as a .zip: 

`$ syfala examples/virtualAnalog.dsp --export virtualanalog  `

### General Options

| option               |        accepted values        | description                                                  |
| -------------------- | :---------------------------: | ------------------------------------------------------------ |
| **`--compiler, -c`** |         `HLS | VHDL`          | chooses between **HLS** (default) or **VHDL** for Faust IP generation |
| **`--report, -r`**   |           no value            | displays **HLS report** at the end of the toolchain run (HLS only) |
| **`--export, -e`**   | build identifier (any string) | exports build directory as a .zip file                       |
| **`--demo `**        |           no value            | this runs the toolchain as follows: `syfala examples/virtualAnalog.dsp --all --export demo --report --gui --flash ` |

### Run steps

**Note**: the `--all` is not necessary if you wish to run all steps, just run: 

`syfala myfaustdsp.dsp `

| `--all`             | runs all toolchain compilation steps (from `--arch` to `--gui`) |
| ------------------- | ------------------------------------------------------------ |
| **`--reset`**       | resets current build directory (**careful, all files from previous build will be lost**) |
| **`--arch`**        | uses Faust to generate ip/host cpp files for HLS  and Host application compilation |
| **`--ip`**          | runs Vitis HLS on generated ip cpp file                      |
| **`--project`**     | generates Vivado project                                     |
| **`--syn`**         | synthesizes full Vivado project                              |
| **`--app`**         | compiles Host application, exports sources and .elf output to `build/sw_export` |
| **`--app-rebuild`** | recompiles Host application (running `--app` won't work if you only want to rebuild the application after some changes) |
| **`--gui`**         | compiles Faust GUI controller                                |
| **`--flash`**       | flashes boot files on device                                 |

### Run parameters

| parameter                | accepted values                            | default value |
| :----------------------- | ------------------------------------------ | ------------- |
| **`--nchannels, -n`**    | an even number (`2`, `4`, `6`, etc.)       | `2`           |
| **`--memory, -m`**       | `DDR | STATIC`                             | `DDR`         |
| **`--board, -b`**        | `Z10 | Z20 | GENESYS`                      | `Z10`         |
| **`--sample-rate`**      | `48000 | 96000 | 192000 | 384000 | 768000` | `48000`       |
| **`--sample-width`**     | `16 | 24 | 32`                             | `24`          |
| **`--controller-type`**  | `DEMO | PCB1 | PCB2 | PCB3 | PCB4`         | `PCB1`        |
| **`--ssm-volume`**       | `FULL | HEADPHONE | DEFAULT`               | `DEFAULT`     |
| **`--ssm-speed`**        | `FAST | DEFAULT`                           | `DEFAULT`     |

### Parameter description

| parameter               | description                                                  |
| ----------------------- | ------------------------------------------------------------ |
| **`--nchannels, -n`**   | sets the project's number of channels, it is equal to the **maximum number of input/output channels** rounded to the superior even number (e.g: if 3 channels: `nchannels` would be 4) |
| **`--memory, -m`**      | selects if **external** **DDR3** is used. Enable if you use some delay, disable if you do want any  memory access (should not be disabled) |
| **`--board`**           | Defines target board. **Z10** ,**Z20** and **GENESYS** only. If you have a VGA port (rather than 2 HDMI ports), you have an old Zybo version, which is not supported. |
| **`--sample-rate`**     | Changes **sample rate** value (Hz). Only 48kHz and 96kHz is available for **SSM** embeded codec. 192000 (**ADAU1777** and **ADAU1787** only)  384000 (**ADAU1787** only)  768000 (**ADAU1787** only and with `--sample--width 16` only) |
| **`--sample-width`**    | Defines **sample bit depth** (16\|24\|32)                    |
| **`--controller-type`** | Defines the controller used to drive the controls when **SW3** is **UP**. (**SW3** **DOWN** for **software** control), <u>**SEE BELOW**</u> for details on each value |
| **`--ssm-volume`**      | Chooses audio codec to use. For now, it only changes the scale factor. **FULL**: Maximum (**WARNING**: for speaker only, do not use with headphones). **HEADPHONE**: Lower volume for headphone use. **DEFAULT**: Default value +1dB because the true 0dB (`0b001111001`) decreases the signal a little bit. |
| **`--ssm-speed`**       | Changes **SSM ADC/DAC** sample rate. **DEFAULT**: 48kHz sample rate. **FAST**: 96Khz sample rate |

## Hardware configuration (Zybo Z7-10/20)

- Jumper **JP5** should be on *JTAG* 
- **Power select** jumper should be on *USB*  
- **Switches** SW0, SW1, SW2, SW3 should be **down**  
- The **audio input** is **LINE IN** (blue), not MIC IN  
- The **audio output** is the black **HPH OUT** jack  

### Control

To control your DSP, you can either use a Hardware Controller Board or a GUI on your computer.  

#### GUI (SW3 DOWN)  

**SW3** should be **down** (0).

If you use GUI, open the GUIcontroller after booting with the following command:

```
make gui
```

#### Syfala Hardware Controller Board (SW3 UP)  

**SW3** should be **up** (1).

If you use a Hardware Controller Board, please set the `--controller-type` command-line parameter to the proper value (see below)

##### Controller-type values description

- **DEMO**:  Popophone demo box
- **PCB1**: Emeraude PCB config 1: 4 knobs, 2 switches, 2 sliders (default)
- **PCB2**: Emeraude PCB config 2: 8 knobs
- **PCB3**: Emeraude PCB config 3: 4 knobs, 4 switches 
- **PCB4**: Emeraude PCB config 4: 4 knobs above, 4 switches below 

You can swap from hardware to software controller during DSP execution by changing SW3.

### Switch description

Default config in **bold**  

<pre>
  SW3   SW2    SW1    SW0
+-----+-----+-------+------+
| Hard| ADAU| BYPASS| MUTE |
|     |     |       |      |
|     |     |       |      |
| <b>GUI</b> | <b>SSM</b> |<b>USE DSP</b>|<b>UNMUTE</b>|
+-----+-----+-------+------+
</pre>

- **SW3**: Controller type select: hardware (Controller board) or software (GUI).  
- **SW2**: Audio codec input select (ADAU=external or SSM=onboard). Does not affect output.  
- **SW1**: Bypass audio dsp.  
- **SW0**: Mute.  

### Status LEDs

The RGB led indicate the program state:

* **BLUE** = WAITING
* **GREEN** = ALL GOOD
* **ORANGE** = WARNING (Bypass or mute enable)
* **RED** = ERROR (Config failed or incompatible). Could happen if you select SSM codec with incompatible sample rate.

The 4 LEDs above the switches indicate the switches state. If one of them blink, it indicates the source of the warning/error.

### SD card files

You can put the program on an SD card (if you want something reproductible and easily launchable, for the demos...).  
After a `make` command, you should see a `BOOT.bin` file in SW_export (or you can build it with `make boot_file`).  
Put the file on the root of SD card. And don't forget to put JP5 on 'SD' position !  
