#include <iostream>
#include <string>
#include <vector>
#include "sqlite-amalgamation-3430200/sqlite3.h"

using namespace std;

class DBManager
{
    private:

    string DBDirectory;
    string DBName;
        
    public:

        //TODO implement correct construtor
        DBManager(string a, string b)
        {
            DBDirectory = a;
            DBName = b;
        }  
        

        //takes a username and pass word
        //and returns if the two match
        bool CheckPassword(string UserName, string Password)
        {
            return false;
        }

    
        //takes a user name and Table that you want to look in
        // and returns a vector of vectors of the info from that table that is 
        //accosiated with that user
        //TODO sepecify type of vector to be returned
        vector<vector<int>> getInfo(string UserName, string Table)
        {
            

            return vector<vector<int>>();
        }

        //takes user name table and field
        //returns the values associcated with that user and field
        vector<int> getInfo(string UserName, string Table, string Field)
        {
              return vector<int>();
        }
        
        //take a UserName,subscriptionID,table, field, and info
        //puts the info into the table at subscriptionID with colmunn field
        bool Updaterecord(string UserName,string SubscriptionID,string Table, string Field, string Info)
        {
           
              return false;
        }
        //overload for number fields
        bool Updaterecord(string UserName,string Table, string Field, int Info)
        {
           
              return false;
        }

        //takes a UserName, Table, and info
        //adds a row in table with info
        //also adds a row to relationship table with user name and id of new row in table
        bool addrecord(string UserName, string Table, vector<string> info )
        {
            return false;
        }
        
                
        

};

int main()
{

    DBManager test = DBManager("Documents","TestDataBase"); 
    
    //cout << test.getDBName() << endl;    

    return 0;
}


