#include <iostream>
#include <string>

using namespace std;

int main(int argc, char** argv)
{
  string string_cd_title;
  string string_artist;
  string string_message;

  string string_track_title;
  
  getline( cin, string_cd_title );
  getline( cin, string_artist );
  getline( cin, string_message );

  // HEADER
  cout << "CD_DA" << endl << endl;
  cout << "CD_TEXT {" << endl;
  cout << "  LANGUAGE_MAP {" << endl;
  cout << "    0 : EN" << endl;
  cout << "  }" << endl;
  cout << "  LANGUAGE 0 {" << endl;
  cout << "    TITLE \"" << string_cd_title << "\"" << endl;
  cout << "    PERFORMER \"" << string_artist << "\"" << endl;
  cout << "    DISC_ID \"" << "" << "\"" << endl;
  cout << "    UPC_EAN \"" << "" << "\"" << endl;
  cout << "    MESSAGE \"" << string_message << "\"" << endl;
  cout << "  }" << endl;
  cout << "}" << endl;
  
  for( string line; getline( cin, line ); )
    {
      cout << endl;
      // for each line
      cout << "TRACK AUDIO" << endl;
      cout << "NO COPY" << endl;
      cout << "NO PREMPHASIS" << endl;
      cout << "TWO_CHANNEL_AUDIO" << endl;
      cout << "CD_TEXT {" << endl;
      cout << "  LANGUAGE 0 {" << endl;
      cout << "    TITLE \"" << line.substr(3, line.length() - 7 ) << "\"" << endl;
      cout << "    PERFORMER \"" << string_artist << "\"" << endl;
      cout << "    ISRC \"" << "" << "\"" << endl;
      cout << "    MESSAGE \"" << string_message << "\"" << endl;
      cout << "  }" << endl;
      cout << "}" << endl;
      cout << "FILE \"" << line << "\" 0" << endl;
      
    }
  return 0;
}
