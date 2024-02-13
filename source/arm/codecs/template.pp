/******************************************************************************
 * @file ADAU17xxReg.cpp
 * Autogenerated with sigmaS_to_syfala_generator.tcl.
 * Registers configuration for ADAU17xx.
 * Based on X_IC_1_REG.h file, generated with Sigma Studio 
 * This file doesn't need to be regenerated each time. Only the header file configures the registers.
 * 
 * @authors M.POPOFF
 * @date: 
 * 
 *****************************************************************************/

#include <syfala/arm/codecs/ADAU17xx.hpp>
#include <syfala/arm/codecs/ADAU17xxReg.h>
#include <syfala/arm/gpio.hpp>
#include <syfala/utilities.hpp>

#define CTARGET

#define REGWRITE(_A, _D, _O)                                                    \
if (ADAU17xx::regwrite(bus, codec_addr, _A, _D, _O)!= XST_SUCCESS) {                          \
    sy_debug("\033[2K%s Could not write to register 0x%02x\n\r",CTARGET, _A);       \
    return XST_FAILURE;                                                                   \
}

namespace Syfala::ADAU17xx {
int initialize(int bus, unsigned long codec_addr) {
    [...]
    return XST_SUCCESS;
}
}
