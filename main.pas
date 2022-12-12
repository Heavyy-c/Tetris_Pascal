program tetris_prog;
uses player_controller, blocks;

var
	block: ;
	field: ;
	count_of_blocks: integer;

BEGIN
	{$I-}
	{INIT}
	if (ScreenWidth < 80) or (ScreenHeight < 25) then
	begin
		writeln('Please resize window (25x85 minimum)');
		halt(1);
	end;
	fopen(score_file, 'r');
	if IOResult <> 0 then
	begin

	end;
	clrscr;
	GetAccounts(score_file, account_list);
	ChooseAccount(account_list, account);
	DrawBaseUI(BACKGROUND_COLOR, BORDER_COLOR);
	DrawField(field);
	WriteName(account);
	WriteMaxScore(account);
	WriteCurrentScore(count_of_blocks);
	SpawnBlock(block);
	while true do
	begin
		button := GetButton();
		CleanUpBuffer();
		if BlockCollision(block, construction) then
		begin
			JoinBlockWithConstruction(block, construction);
			RemoveConstructionLines(construction);
			if ConstructionOutOfLimits(construction, field) then
				break;
			GenerateNewBlock(block);
			SpawnBlock(block);
			Inc(count_of_blocks);
			WriteCurrentScore(count_of_blocks);
		end;
		HideBlock(block);
		case button of
		UP_ARROW:
			RotateBlock(block, field);
		DOWN_ARROW:
			ThrowBlockDown(block, construction);
		LEFT_ARROW:
			MoveBlockLeft(block, field);
		RIGHT_ARROW:
			MoveBlockRight(block, field);
		end;
		ShowBlock(block);
		delay(FRAME_DELAY);
	end;
	score := MakeScoreData(time, count_of_blocks);
	write(score_file, score);
	write(score);
END.
