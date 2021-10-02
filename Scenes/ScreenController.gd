extends Control



func _open_app(app):
	match app:
		"Gogl":
			$AppsPanels/Gogl.visible = true
		"Crypto":
			$AppsPanels/Crypto.visible = true
