unit field;

interface

type
	field_data = record
		SizeX, SizeY, X_Start, Y_Start: integer;
	end;

function IsCoordInField(coord: integer; field: field_data): boolean;

implementation

function XCoordInField(x: integer; field: filed_data): boolean;
begin
	XCoordInField := (x >= field.X_Start) and
			(a <= (field.X_Start + SizeX));
end;

function YCoordInField(y: integer; field: filed_data): boolean;
begin
	YCoordInField := (y >= field.Y_Start) and
			(y <= (field.Y_Start + SizeY));
end;

function IsCoordInField(coord: coordinates; field: field_data): boolean;
begin
	IsCoordInField := XCoordInField(coord.x, field) and
				YCoordInField(coord.y, field);
end;


end.
