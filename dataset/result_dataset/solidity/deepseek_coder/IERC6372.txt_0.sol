import UIKit
import ARKit
class ViewController: UIViewController, ARSCNViewDelegate {
    @IBOutlet var arView: ARSCNView!
    override func viewDidLoad() {
        super.viewDidLoad()
        arView.delegate = self
        arView.showsStatistics = true
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let sceneView = arView.sceneView()
        sceneView.delegate = self
        let scene = SCNScene(named: "art.scnassets/ship.scn")!
        sceneView.scene = scene
    }
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        guard let shipScene = SCNScene(named: "art.scnassets/ship.scn") else { return }
        node.addChildNode(shipScene)
    }
}