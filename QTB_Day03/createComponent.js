var component;
var sprite;

function createSpriteObject() {
    component = Qt.createComponent("Button.qml");
    if(component.status === component.ready || component.status === Component.Error) {
        finishCreation();
    } else {
        component.statusChanged.connect(finishCreation);
    }
}
function finishCreation() {
    if (component.status === Component.Ready) {
        sprite = component.createObject(root, {"x": 100, "y": 100});
        if (sprite === null) {
            console.log("Error creating object");
        }
    } else if (component.status === Component.Error) {
        console.log("Error loading component:", component.errorString());
    }
}
