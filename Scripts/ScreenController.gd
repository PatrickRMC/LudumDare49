extends Control



func _open_app(app):
	for i in $AppsPanels.get_child_count():
		$AppsPanels.get_child(i).visible = false
	match app:
		"Gogl":
			$AppsPanels/GoglApp.visible = true
		"Crypto":
			$AppsPanels/CryptoApp.visible = true
		"ManageCrypto":
			$AppsPanels/ManageCryptoApp.visible = true
		"Store":
			$AppsPanels/StoreApp.visible = true
