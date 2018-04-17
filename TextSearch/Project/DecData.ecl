IMPORT TextSearch.Inverted;
IMPORT STD;

fileName := '~ap.xml';

Work1 := RECORD
  UNICODE doc_number{XPATH('/DOC/DOCNO')};
  UNICODE content{MAXLENGTH(32000000),XPATH('<>')};
  UNICODE text{MAXLENGTH(32000000),XPATH('/DOC/TEXT')};
  UNSIGNED8 file_pos{VIRTUAL(fileposition)};
END;
ds0 := DATASET(fileName, Work1, XML('/DOC', NOROOT));


Inverted.Layouts.DocumentIngest cvt(Work1 lr) := TRANSFORM
  SELF.identifier := TRIM(lr.doc_number, LEFT,RIGHT);
  SELF.seqKey := fileName + '-' + INTFORMAT(lr.file_pos,12,1);
  SELF.slugLine := lr.text[1..STD.Uni.Find(lr.text,'.',1)+1];
  SELF.content := lr.content;
END;

ds1 := PROJECT(ds0, cvt(LEFT));
// OUTPUT(ENTH(ds1, 20), NAMED('Sample_20'));
OUTPUT(ds1,, '~thor::lily::ap.xml', THOR);


