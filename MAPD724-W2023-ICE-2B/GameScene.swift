import SpriteKit
import GameplayKit

let screenSize = UIScreen.main.bounds
var screenWidth: CGFloat?
var screenHeight: CGFloat?

class GameScene: SKScene {
    
    //instance variables
    var ocean1: Ocean?
    var ocean2: Ocean?
    var player: Player?
    var island: Island?
    var clouds: [Cloud] = []
    
    override func sceneDidLoad() {
        screenWidth = frame.width
        screenHeight = frame.height
        print("Screen Width: \(String(describing: screenWidth))")
        print("Screen Height: \(String(describing: screenHeight))")
        
        name = "GAME"
        
        //add first ocean to the scene
        ocean1 = Ocean()
        ocean1?.Reset()
        addChild(ocean1!)
        
        //add second ocean to scene
        ocean2 = Ocean()
        ocean2?.position.y = -627
        addChild(ocean2!)
        
        //add player to the scene
        player = Player()
        addChild(player!)
        
        //add island to the scene
        island = Island()
        addChild(island!)
        
        //add clouds to the scene
        for _ in 0...2 {
            let cloud = Cloud()
            clouds.append(cloud)
            addChild(cloud)
        }
        
        print("Game Scene Loaded")
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        player?.TouchMove(newPos: CGPoint(x: pos.x, y: -640))
        print("Touch Down")
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        player?.TouchMove(newPos: CGPoint(x: pos.x, y: -640))
        print("Touch Moved")
    }
    
    func touchUp(atPoint pos : CGPoint) {
        player?.TouchMove(newPos: CGPoint(x: pos.x, y: -640))
        print("Touch Up")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
        
    override func update(_ currentTime: TimeInterval) {
        ocean1?.Update()
        ocean2?.Update()
        player?.Update()
        island?.Update()
        
        //update array clouds
        for cloud in clouds
        {
            cloud.Update()
        }
    }
}
