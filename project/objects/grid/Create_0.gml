var cellWidth = 32
var cellHeight = 32

var gridWidth = room_width / cellWidth
var gridHeight = room_height / cellHeight

mpGrid = -1

function buildGrid() {
	var cellWidth = 32
	var cellHeight = 32

	var gridWidth = room_width / cellWidth
	var gridHeight = room_height / cellHeight
	
	if mpGrid > -1 {
		mp_grid_destroy(mpGrid)	
	}
	
	mpGrid = mp_grid_create(0,0,gridWidth,gridHeight, cellWidth,cellHeight)
	
	mp_grid_clear_all(mpGrid)
	
	mp_grid_add_instances(mpGrid, collision, true)
}

mpGrid = mp_grid_create(0,0,gridWidth,gridHeight, cellWidth,cellHeight)

buildGrid()