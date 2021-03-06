/*
 * QML Material - An application framework implementing Material Design.
 * Copyright (C) 2014 Michael Spencer
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as
 * published by the Free Software Foundation, either version 2.1 of the
 * License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */
import QtQuick 2.0
import QtQuick.Controls 1.2 as Controls
import QtQuick.Controls.Styles 1.2 as ControlStyles
import Material 0.1

Controls.Button {
    id: button

    property int elevation
    property color backgroundColor: elevation > 0 ? "white" : "transparent"
    property color textColor: Theme.lightDark(button.backgroundColor,
                                              Theme.light.textColor,
                                              Theme.dark.textColor)

    style: ControlStyles.ButtonStyle {
        background: View {
            radius: units.dp(2)

            elevation: button.elevation
            backgroundColor: button.backgroundColor

            tintColor: control.pressed ? Qt.rgba(0,0,0, 0.1) : "transparent"

            Ink {
                id: mouseArea
                anchors.fill: parent
                Connections {
                    target: control.__behavior
                    onPressed: mouseArea.onPressed(mouse)
                    onCanceled: mouseArea.onCanceled()
                    onReleased: mouseArea.onReleased(mouse)
                }
            }
        }
        label: Item {
            implicitHeight: Math.max(units.dp(36), label.height + units.dp(16))
            implicitWidth: Math.max(units.dp(64), label.width + units.dp(16))

            Label {
                id: label
                anchors.centerIn: parent
                text: control.text
                style: "button"
                color: button.textColor
            }
        }
    }
}
