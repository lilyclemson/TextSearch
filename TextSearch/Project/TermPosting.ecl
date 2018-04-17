IMPORT TextSearch.Inverted;
IMPORT TextSearch.Common;
IMPORT TextSearch.Resolved;
IMPORT STD;

prefix := '~thor::lily';
inputName := prefix + '::ap.xml';
stem := prefix + 'LDA_AP';
instance := 'initial';
inDocs := DATASET(inputName, Inverted.Layouts.DocumentIngest, THOR);
info := Common.FileName_Info_Instance(prefix , instance);
kwm := Common.Default_Keywording;
enumDocs    := Inverted.EnumeratedDocs(info, inDocs);
p1 := Inverted.ParsedText(enumDocs);
rawPostings := Inverted.RawPostings(enumDocs);
termPostings := Inverted.TermPostings(rawPostings,kwm);
OUTPUT(termPostings);