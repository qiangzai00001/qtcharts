/****************************************************************************
**
** Copyright (C) 2014 Digia Plc
** All rights reserved.
** For any questions to Digia, please use contact form at http://qt.digia.com
**
** This file is part of the Qt Enterprise Charts Add-on.
**
** $QT_BEGIN_LICENSE$
** Licensees holding valid Qt Enterprise licenses may use this file in
** accordance with the Qt Enterprise License Agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and Digia.
**
** If you have questions regarding the use of this file, please use
** contact form at http://qt.digia.com
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.0
import QtTest 1.0
import QtCommercial.Chart 1.3

Rectangle {
    width: 400
    height: 300

    TestCase {
        id: tc1
        name: "tst_qml-qtquicktest CategoryAxis 1.3"
        when: windowShown

        function test_minMax() {
            compare(lineSeries1.axisX.min, 0, "AxisX min");
            compare(lineSeries1.axisX.max, 10, "AxisX max");
            compare(lineSeries1.axisY.min, 0, "AxisY min");
            compare(lineSeries1.axisY.max, 10, "AxisY max");
        }

        function test_categories() {
            compare(lineSeries1.axisY.startValue, 0, "AxisY start value");
            compare(lineSeries1.axisY.count, 3, "AxisY count");
            compare(lineSeries1.axisY.categoriesLabels[0], "label0", "AxisY categories labels");
            compare(lineSeries1.axisY.categoriesLabels[1], "label1", "AxisY categories labels");
            compare(lineSeries1.axisY.categoriesLabels[2], "label2", "AxisY categories labels");
        }
    }

    ChartView {
        id: chartView
        anchors.fill: parent

        LineSeries {
            id: lineSeries1
            axisX: ValuesAxis {
                id: axisX
                min: 0
                max: 10
            }
            axisY: CategoryAxis {
                id: axisY
                min: 0
                max: 10
                startValue: 0
                CategoryRange {
                    label: "label0"
                    endValue: 1
                }
                CategoryRange {
                    label: "label1"
                    endValue: 3
                }
                CategoryRange {
                    label: "label2"
                    endValue: 10
                }
            }
            XYPoint { x: -1; y: -1 }
            XYPoint { x: 0; y: 0 }
            XYPoint { x: 5; y: 5 }
        }
    }
}