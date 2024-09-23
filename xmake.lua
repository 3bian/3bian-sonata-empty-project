-- Copyright 3bian Limited and CHERIoT Contributors.
-- SPDX-License-Identifier: Apache-2.0

set_project("Empty Project template")

sdkdir = "third_party/cheriot_rtos/sdk"
set_toolchains("cheriot-clang")

includes("third_party/cheriot_rtos/sdk",
         "third_party/cheriot_rtos/sdk/lib")

option("board")
    set_default("sonata")

compartment("entry_point")
    add_deps("debug",
             "freestanding")
    add_files("src/main.cc")

firmware("empty-project")
    add_deps("entry_point")
    on_load(function(target)
        target:values_set("board", "$(board)")
        target:values_set("threads", {
            {
                compartment = "entry_point",
                priority = 1,
                entry_point = "init",
                stack_size = 0x200,
                trusted_stack_frames = 1
            }
        }, {expand = false})
    end)
