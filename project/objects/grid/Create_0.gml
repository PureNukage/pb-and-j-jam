var cellWidth = 32
var cellHeight = 32

var gridWidth = room_width / cellWidth
var gridHeight = room_height / cellHeight

function buildGrid() {
	mp_grid_clear_all(mpGrid)
	
	mp_grid_add_instances(mpGrid, collision, true)
}

mpGrid = mp_grid_create(0,0,gridWidth,gridHeight, cellWidth,cellHeight)

buildGrid()