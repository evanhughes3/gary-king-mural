import UIKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!


    override func viewDidLoad() {
        super.viewDidLoad()
        addMural()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARWorldTrackingConfiguration()
        self.sceneView.session.run(configuration)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.sceneView.session.pause()
    }

    func addMural() {
        let plane = SCNPlane(width: 0.1, height: 0.2)
        let material = SCNMaterial()
        material.diffuse.contents = #imageLiteral(resourceName: "garyMural");
        plane.materials = [material]
        let planeNode = SCNNode(geometry: plane)
        planeNode.position = SCNVector3(0,0,-0.5)

        let scene = SCNScene()
        scene.rootNode.addChildNode(planeNode)
        self.sceneView.scene = scene
    }


}

