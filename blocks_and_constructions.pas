unit blocks_and_constructions;

interface

const
	CountOfCoordinates = 64;
type
	block_unit = record
		x, y: integer;
	end;
	block_units_array = array[1..CountOfCoordinates] of block_unit;
	block_types = (T_Form, Line_Form, Cube_Form, L_Form, Connector_Type);
	block_data = record
		block_type: block_types;
		block_units: block_units_array;
	end;
procedure GenerateNewBlock(var block: block_data);
procedure MirrorBlock(var block: block_data);
procedure MoveBlockLeft(var block: block_data; field: field_data);
procedure MoveBlockRight(var block: block_data; field: field_data);
implementation

end.
