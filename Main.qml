import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    height: 780
    title: qsTr("Custom WebView Example")
    visible: true
    width: 1024

    ColumnLayout {
        anchors.fill: parent
        spacing: 10

        RowLayout {
            Layout.fillWidth: true

            TextField {
                id: urlInput

                Layout.fillWidth: true
                placeholderText: "Enter URL"
                text: webView.url

                onAccepted: webView.url = urlInput.text
            }
            Button {
                text: "Load"

                onClicked: webView.url = urlInput.text
            }
        }

		NativeWebView {
			id: webView

			Layout.fillHeight: true
			Layout.fillWidth: true
			url: "https://www.google.it/maps"

			WindowContainer {
				id: windowContainer
				x: 20
				y: 20
				width: 200
				height: 100

				window: Window {
					Rectangle {
						id: childItem
						width: windowContainer.width
						height: windowContainer.height
						color: "blue"
					}
				}
			}
		}
	}
}
