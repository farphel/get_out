# notes/journal

things i've learned while making this small 2d godot game.

### 20260210

* mob scene: mob and player consist of a `CharacterBody2D` root node,
  a `Sprite2D` child node for the image and a `CollisionBody2D` child
  node for game physics (bouncing off walls and being able to use the
  `move_and_slide()` method for motion). the mob scene has an
  additional `Area2D` node (with child of `CollisionBody2D`) for
  game mechanics (a "sensor" for catching the player or a "hurtbox"
  to know when to take damage).
<br/>
  * `CharacterBody2D` (root node of Mob)
    * `Sprite2D` (for image)
    * `CollisionBody2D` (for "solid" box for wall obstruction)
    * `Area2D` (the "sensor" box)
      * `CollisionBody2D` (the "detection" box when catching player)
<br/>
  * sizing of the two `CollisionBody2D` nodes: the `Area2D` sensor
    should be slightly *smaller* than the `CharacterBody2D` node. this
    is more accommodating for a minor brush with the mob, but also
    allows the mob to slightly pass into the walls.
<br/>
* layers and masks: restrict how game objects interact with each other
  via layers/masks. for example, the `walls` can be on layer 1 with
  no mask (layer 1 is where the walls live and the mask is what they
  "see"). the player can be on layer 2 and interacts with mask 2 (walls)
  the mob (root) is on layer 3 and mask 1 (walls). the mob's `Area2D`
  node is not on a layer, but uses mask 2 (player) to detect when it
  catches up with the player.

