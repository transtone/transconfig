#!/usr/bin/python

# original: https://github.com/TheWanderer/dmenu-python

# TODO
# possibly pickle an ordered dict

import os, sys
import subprocess
import pickle

## pass dmenu args on command line
DMENU = ['dmenu']
DMENU.extend(sys.argv[1:])

UPDATE = "update_dspawn"
CACHE_FILE = "~/bin/dspawn"

def create_cache():
    programs = subprocess.getoutput("dmenu_path").split("\n")
    programs.append(UPDATE)

    ## return a dictionary with program name
    ## as key and count as value
    return dict.fromkeys(programs,0)

def get_cache():
    try:
        f = open(CACHE_FILE, 'rb')
        return pickle.load(f)
    except:
        return new_cache()

def store_cache(cache):
    with open(CACHE_FILE, 'wb') as f:
        pickle.dump(cache, f)

def new_cache():
    c = create_cache()
    store_cache(c)
    return c

def update_cache():
    new = create_cache()
    old = get_cache()
    for k in old:
        if k in new:
            new[k] = old[k]
    store_cache(new)
    return new

def main():
    cache = get_cache()
    ## sort cache according to most frequently used
    sorted_cache = sorted(cache.items(), key=lambda el: el[1], reverse=True)
    programs = '\n'.join([x[0] for x in sorted_cache])

    dmenu = subprocess.Popen(DMENU, stdin=subprocess.PIPE, stdout=subprocess.PIPE)
    command = dmenu.communicate(programs.encode('utf-8'))[0]

    if len(command) > 0:
        command = command.decode('ascii')
        if command == UPDATE:
            cache = update_cache()
        else:
            subprocess.Popen([command])

        ## if the command does not exist already
        ## then add it to the cache
        if not cache.get(command):
            cache[command] = 0

        cache[command] += 1
        store_cache(cache)

if __name__ == "__main__":
    main()

