IMPORT TextSearch.Inverted;
IMPORT TextSearch.Common;
IMPORT STD;

prefix := '~thor::lily';
inputName := prefix + '::ap.xml';
stem := prefix + 'LDA_AP';
instance := 'initial';


slices := INVERTED.Build_Slice_Action(inputName, prefix, instance);
slices;


inDocs := DATASET(inputName, Inverted.Layouts.DocumentIngest, THOR);
info := Common.FileName_Info_Instance(stem, instance);

// enumDocs    := Inverted.EnumeratedDocs(info, inDocs);
// p1 := Inverted.ParsedText(enumDocs);
// rawPostings := Inverted.RawPostings(enumDocs);
// OUTPUT(CHOOSEN(p1,30));

