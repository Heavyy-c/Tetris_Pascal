unit block_forms;

interface

procedure ClearBlock(var block: );
procedure SetNewBlock(var dest: ; block_type: );
procedure MirrorBlock(var block: );

implementation

const
	TBlockFormLeft =	'###   ' +
				'###   ' +
				'######' +
				'######' +
				'###   ' +
				'###   ';

	TBlockFormRight =	'   ###' +
				'   ###' +
				'######' +
				'######' +
				'   ###' +
				'   ###';

	TBlockFormUp =		'#########' +
				'#########' +
				'   ###   ' +
				'   ###   ';

	TBlockFormDown =	'   ###   ' +
				'   ###   ' +
				'#########' +
				'#########';
	TBlockFormLeftMirrored = TBlockFormRight;
	TBlockFormRightMirrored = TBlockFormLeft;
	TBlockFormUpMirrored = 	TBlockFormDown;
	TBlockFormDownMirrored = TBlockFormUp;

	LineBlockFormLeft =	'###' +
				'###' +
				'###' +
				'###' +
				'###' +
				'###' +
				'###' +
				'###';
	LineBlockFormRight = LineBlcokFormLeft;

	LineBlockFormUp =	'##############' +
				'##############';
	LineBlockFormDown = LineBlockFormUp;
				

	CubeBlockForm =		'######' +
				'######' +
				'######' +
				'######' +

	LBlockFormLeft =	'###   ' +
				'###   ' +
				'###   ' +
				'###   ' +
				'######' +
				'######';
	LBlockFormLeftMirrored =
				'######' +
				'######' +
				'###   ' +
				'###   ' +
				'###   ' +
				'###   ';

	LBlockFormRight =	'   ###' +
				'   ###' +
				'   ###' +
				'   ###' +
				'######' +
				'######';
	LBlockFormRightMirrored =
				'######' +
				'######' +
				'   ###' +
				'   ###' +
				'   ###' +
				'   ###';

	LBlockFormUp = 		'#########' +
				'#########' +
				'      ###' +
				'      ###';

	LBlockFormUpMirrored =	'#########' +
				'#########' +
				'###      ' +
				'###      ';

	LBlockFormDown = 	'      ###' +
				'      ###' +
				'#########' +
				'#########';
	LBlockFormDownMirrored =
				'###      ' +
				'###      ' +
				'#########' +
				'#########';
	
	ConnectorBlockFormLeft =
				'###   ' +
				'###   ' +
				'######' +
				'######' +
				'   ###' +
				'   ###';
	ConnectorBlockFormRight =
				'   ###' +
				'   ###' +
				'######' +
				'######' +
				'###   ' +
				'###   ';
	ConnectorBlockFormDown =
				'######   ' +
				'######   ' +
				'   ######' +
				'   ######';

	ConnectorBlockFormUp =	'   ######' +
				'   ######' +
				'######   ' +
				'######   ';

procedure ClearBlock(var block: ; array_size_x, array_size_y: integer);
begin
	for i := 1 to array_size_y do
		for k := 1 to array_size_x:
			block[i, k] := '';
end;

procedure SetNewBlock(var dest: ; block_type: );
procedure MirrorBlock(var block: );

end.
