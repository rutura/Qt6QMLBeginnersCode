// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

.import "utilities2.js" as Utilities2

function greeting()
{
    console.log("Hello there from external JS file: utilities1.js")
}

function combineAges( age1, age2)
{
    return Utilities2.add(age1,age2)
}
