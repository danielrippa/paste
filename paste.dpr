program paste;

{$mode delphi}

uses windows;

type

  TFilePaths = array of string;

function ClipboardFiles: TFilePaths;
var
  h: THandle;
  filesCount: Integer;
  buffer: Array [0..MAX_PATH] of Char;
  i: Integer;
begin
  OpenClipboard(0);
  try
    h := GetClipboardData(CF_HDROP);
    if h <> 0 then begin
      filesCount := DragQueryFile(h, $FFFFFFFF, Nil, 0);
      if filesCount > 0 then begin
        SetLength(Result, filesCount);
        for i := 0 to filesCount - 1 do begin
          DragQueryFile(h, i, buffer, sizeof(buffer));
          Result[i] := String(buffer);
        end;
      end;
    end;
  finally
    CloseClipboard();
  end;
end;

var
  i: Integer;
  filepaths: TFilePaths;
begin
  filepaths := ClipboardFiles;
  if Length(filepaths) > 0 then begin
    for i := 0 to High(filepaths) do begin
      Writeln(filepaths[i]);
    end;
  end;
end.
