#include<iostream>

using namespace std;

string CURR_IDENTIFIER = "";

string return_next_identifier(){
	// this function always returns a new variable name
	if(CURR_IDENTIFIER == "_"){
		CURR_IDENTIFIER = "_a";
		return CURR_IDENTIFIER;
	}
	int n = CURR_IDENTIFIER.size();
	for(int i = n - 1; i > 0; --i){
		if(CURR_IDENTIFIER[i] != 'z'){
			CURR_IDENTIFIER[i] += 1;
			for(int j = i + 1; j < n; ++j){
				CURR_IDENTIFIER[j] = 'a';
			}
			return CURR_IDENTIFIER;
		}
	}
	CURR_IDENTIFIER = "_";
	for(int i = 0; i < n; ++i){
		CURR_IDENTIFIER += 'a';
	}
	return CURR_IDENTIFIER;
}

int main(){
	for(int i = 0; i < 100; ++i){
		cout<<return_next_identifier()<<'\n';
	}


	return 0;

}

























