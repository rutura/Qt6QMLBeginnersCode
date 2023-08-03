// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Multiple Signal Parameters")

    signal info(string last_name,string first_name,int age)

    //Handle all three parameters
    onInfo: function(l,f,a){
        print("last name: " + l + ", first name: " + f +", age: "+ a)
    }

    //Only handle the first two
    /*
    onInfo: function(l,f){
        print("last name: " + l + ", first name: " + f)
    }
    */
    //Only handle the first one
    /*
    onInfo: function(l){
        print("last name: " +l)
    }
    */
    //Can only omit trailling parameters. Can't only ignore last name
    /*
    onInfo: function(f,a){
        print(" first name: " + f +", age: "+ a)
    }
    */
    //Non trailling parameters can be ignored through some hack
    /*
    onInfo: function(_,f,a){
        print(" first name: " + f +", age: "+ a)
    }
    */
    Rectangle{
        id: rectId
        width: 300;
        height: 300
        color: "blue"

        MouseArea{
            anchors.fill: parent
            onClicked: {
                info("John", "Snow", 33)
            }
        }
    }
}
