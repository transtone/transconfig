#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<unistd.h>
#include<errno.h>
#include<dirent.h>
#include<limits.h>
#include<fcntl.h>
#include<sys/stat.h>
#include<map>
#include<algorithm>
#include<string>

using namespace std;

char log[PATH_MAX + 1];
char path[65536];
char out[67108864 + 1];
char name[NAME_MAX + 1];
char tmp[4096];
map<string,int> dic;
pair<string,int> lis[262144];

bool cmp(const pair<string,int> &a,const pair<string,int> &b){
    if(a.second == b.second){
        return a.first < b.first;
    }
    return a.second > b.second;
}

int main(int argc,char **argv){
    int i;

    FILE *f;
    int prio;
    char *ptr;
    int fd;
    DIR *dir;
    struct dirent *dirent;
    struct dirent *result;
    struct stat st;
    map<string,int>::iterator it;
    int count;
    char *last;
    FILE *pipe;

    sprintf(log,"%s/.dmenu_wrapper_log",getenv("HOME"));
    if((f = fopen(log,"r")) != NULL){
        while(fgets(name,NAME_MAX,f)){
            name[strlen(name) - 1] = '\0';
            fgets(tmp,4096,f);
            sscanf(tmp,"%d",&prio);
            dic.insert(pair<string,int>(name,prio));
        }
        fclose(f);
    }

    dirent = (struct dirent*)malloc(sizeof(struct dirent) + NAME_MAX + 1);
    strcpy(path,getenv("PATH"));
    ptr = strtok(path,":");
    count = 0;
    while(ptr != NULL){
        fd = open(ptr,O_RDONLY);
        dir = fdopendir(fd);
        while(true){
            readdir_r(dir,dirent,&result);
            if(result == NULL){
                break;
            }
            fstatat(fd,result->d_name,&st,0);
            if(!S_ISREG(st.st_mode) || !(st.st_mode & S_IXUSR)){
                continue;
            }

            prio = 0;
            if((it = dic.find(result->d_name)) != dic.end()){
                prio = it->second;
            }
            lis[count] = pair<string,int>(result->d_name,prio);
            count++;
        }
        closedir(dir);

        ptr = strtok(NULL,":");
    }
    free(dirent);

    sort(lis,lis + count,cmp);
    strcpy(out,"echo -e \"");
    last = out + strlen(out);
    for(i = 0;i < count;i++){
        strcpy(last,lis[i].first.c_str());
        last += strlen(lis[i].first.c_str());
        strcpy(last,"\\n");
        last += 2;
    }
    last -= 2;
    strcpy(last,"\" | dmenu");
    last += strlen(last);
    for(i = 1;i < argc;i++){
        strcpy(last," \"");
        last += 2;
        strcpy(last,argv[i]);
        last += strlen(last);
        *last = '\"';
        last += 1;
    }

    pipe = popen(out,"r");
    name[0] = '\0';
    fgets(name,NAME_MAX,pipe);
    pclose(pipe);

    if(name[0] != '\0'){
        name[strlen(name) - 1] = '\0';
        
        if(fork() == 0){
            execlp(name,name,NULL);
        }

        it = dic.find(name);
        if(it != dic.end()){
            it->second++;
        }else{
            dic.insert(pair<string,int>(name,1));
        }

        if((f = fopen(log,"w")) != NULL){
            for(it = dic.begin();it != dic.end();it++){
                fprintf(f,"%s\n%d\n",it->first.c_str(),it->second);
            }
            fclose(f);
        }
    }

    return 0;
}
