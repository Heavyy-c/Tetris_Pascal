unit blocks_and_constructions;

interface

const
	CountOfCoordinates = 64;
type
	block_cell = record
		x, y: integer;
		using: boolean;
	end;
	block_cells_array =
		array[1..CountOfCoordinates, 1..CountOfCoordinates]
							of block_cell;
	block_types = (T_Form, Line_Form, Cube_Form, L_Form, Connector_Type);
	block_data = record
		block_type: block_types;
		block_cells: block_cells_array;
	end;
procedure GenerateNewBlock(var block: block_data);
procedure MirrorBlock(var block: block_data);
procedure MoveBlockLeft(var block: block_data; field: field_data);
procedure MoveBlockRight(var block: block_data; field: field_data);

implementation

procedure EraseBlockArray(var block_cells: block_cells_array);
var
	i, k: integer;
begin
	for i := 1 to CountOfCoordinates do
		for k := 1 to CountOfCoordinates do
			block_cells[i][k] := '';
end;

procedure SetLineBlockLeft(var block_cells: block_cells_array);
var
	i, k: integer;
begin
	EraseBlockArray(block_cells);
	for i := 1 to LineBlockHeight do
		for k := 1 to LineBlockWidth do
			block_cells[i][k] := '*';
end;

procedure SetLineBlockRight(var block_cells: block_cells_array);
var
	i, k: integer;
begin
	for i := 1 to LineBlockHeight do
		for k := CountOfCoordinates-LineBlockWidth to
						CountOfCoordinates do
			block_cells[i][k] = '*';
end;

procedure SetLineBlockUp(var block_cells: block_cells_array);
var
	i, k: integer;
begin
	for i := 1 to LineBlockWidth do
		for k := 1 to LineBlockHeight do
			block_cells[i][k] := '*';
end;

procedure SetLineBlockDown(var block_cells: block_cells_array);
var
	i, k: integer;
begin
	for i := CountOfCoordinates-LineBlockWidth to CountOfCoordinates do
		for k := 1 to LineBlockHeight do
			block_cells[i][k] := '*';
end;

procedure SetTBlockLeft(var block_cells: block_cells_array);
var
	i, k: integer;
begin
	for i := 1 to TBlockRoofHeight do
		for k := 1 to TBlockRoofWidth do
			block_cells[i][k] := '*';
	for i := TBlockLegWidthStart to TBlockLegWidthEnd do
		for k := 1 to TBlockLegHeigth do
			block_cells[i][k] := '*';
end;

procedure SetTBlockRight(var block_cells: block_cells_array);
var
	i, k: integer;
begin
	for i := 1 to TBlockRoofHeight do
		for k := CountOfCoordinates-TBlockRoofWidth to
						CountOfCoordinates do
			block_cells[i][k] := '*';
	for i := TBlockLegWidthStart to TBlockLegWidthEnd do
		for k := CountOfCoordinates-TBlockLegHeight to
						CountOfCoordinates do
			block_cells[i][k] := '*';
end;

procedure SetTBlockUp(var block_cells: block_cells_array);
var
	i, k: integer;
begin
	for i := 1 to TBlockRoofWidth do
		for k := 1 to TBlockRoofHeigth do
			block_cells[i][k] := '*';
	for i := 1 to TBlockLegHeigth do
		for k := TBlockLegWidthStart to TBlockLegWidthEnd do
			block_cells[i][k] := '*';
end;

procedure SetTBlockDown(var block_cells: block_cells_array);
var
	i, k: integer;
begin
	for i := CountOfCoordinates-TBlockRoofWidth to CountOfCoordinates do
		for k := 1 to TBlockRoofHeigth do
			block_cells[i][k] := '*';
	for i := CountOfCoordinates-TBlockLegHeight to CountOfCoordinates do
		for k := TBlockLegWidthStart to TBlockLegWidthEnd do
			block_cells[i][k] := '*';
end;

procedure SetCubeBlock(var block_cells: block_cells_array);
var
	i, k: integer;
begin
	for i := CubeBlockStart to CubeBlockEnd do
		for k := CubeBlockStart to CubeBlockEnd do
			block_cells[i][k] := '*';
end;

procedure SetLBlockLeft(var block_cells: block_cells_array);
var
	i, k: integer;
begin
	for i := 1 to LBlockRoofHeight do
		for k := 1 to LBlockRoofWidth do
			block_cells[i][k] := '*';
	for i := LBlockLegWidthStart to LBlockLegWidthEnd do
		for k := 1 to LBlockLegHeigth do
			block_cells[i][k] := '*';
end;

procedure SetLBlockRight(var block_cells: block_cells_array);
var
	i, k: integer;
begin
	for i := 1 to LBlockRoofHeight do
		for k := CountOfCoordinates-LBlockRoofWidth to
						CountOfCoordinates do
			block_cells[i][k] := '*';
	for i := 1 to LBlockLegWidth do
		for k := CountOfCoordinates-LBlockLegHeight to
						CountOfCoordinates do
			block_cells[i][k] := '*';
end;

procedure SetLBlockUp(var block_cells: block_cells_array);
var
	i, k: integer;
begin
	for i := 1 to LBlockRoofWidth do
		for k := 1 to LBlockRoofHeight do
			block_cells[i][k] := '*';
	for i := 1 to LBlockLegHeight do
		for k := 1 to LBlockLegWidth do
			block_cells[i][k] := '*';
end;

procedure SetLBlockDown(var block_cells: block_cells_array);
var
	i, k: integer;
begin
	for i := CountOfCoordinates-LBlockRoofWidth to CountOfCoordinates do
		for k := 1 to LBlockRoofHeight do
			block_cells[i][k] := '*';
	for i := CountOfCoordinates-LBlockLegHeight to CountOfCoordinates do
		for k := CountOfCoordinates-LBlockLegWidth to
						CountOfCoordinates do
			block_cells[i][k] := '*';
end;

procedure SetConnectorBlockLeft(var block_cells: block_cells_array);
var
	i, k: integer;
begin
	for i := 1 to ConnectorBlockPartHeight do
		for k := 1 to ConnectorBlockPartWidth do
			block_cells[i, k] := BLOCK_SYMBOL;
	for i := ConnectorBlockPartHeight div 2 to
					2*ConnectorBlockPartHeight do
		for k := ConnectorBlockPartWidth to
				2*ConnectorBlockPartWidth do
			block_cells[i, k] := BLOCK_SYMBOL;
end;

procedure SetConnectorBlockRight(var block_cells: block_cells_array);
var
	i, k: integer;
begin
	for i := 1 to ConnectorBlockPartHeightVertical do
		for k := CountOfCoordinates-ConnectorBlockPartWidthVertical to
						CountOfCoordinates do
			block_cells[i, k] := BLOCK_SYMBOL;
	for i := ConnectorBlockPartHeightVertiacal div 2 to
					2*ConnectorBlockPartHeightVertical do
		for k := CountOfCoordinates-2*ConnectorBlockPartWidthVertical to
				CountOfCoordinates do
			block_cells[i, k] := BLOCK_SYMBOL;
end;

procedure SetConnectorBlockUp(var block_cells: block_cells_array);
var
	i, k: integer;
begin
	for i := 1 to ConnectorBlockPartWidthHorizontal do
		for k := 1 to ConnectorBlockPartHeightHorizontal do
			block_cells[i, k] := BLOCK_SYMBOL;
	for i := ConnectorBlockPartWidthHorizontal to
					2*ConnectorBlockPartWidthHorizontal do
		for k := ConnectorBlockPartHeight div 2 to
				 do
			block_cells[i, k] := BLOCK_SYMBOL;
end;

procedure SetConnectorBlockDown(var block_cells: block_cells_array);

procedure MirrorBlock();

procedure MoveBlockLeft();

procedure MoveBlockRight();

end.
