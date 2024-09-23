// Copyright 3bian Limited and CHERIoT Contributors.
// SPDX-License-Identifier: Apache-2.0

#include <compartment.h>
#include <debug.hh>
#include <fail-simulator-on-error.h>

/// Expose debugging features unconditionally for this compartment.
using Debug = ConditionalDebug<true, "Empty Project compartment">;

/// Thread entry point.
void __cheri_compartment("entry_point") init()
{
	// TODO: Add entry point code here.
}
