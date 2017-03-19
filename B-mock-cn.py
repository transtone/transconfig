import zlib,base64
print 'Inpub user name:'
print base64.b64encode(zlib.compress(base64.b32decode('JVXWG23VOBZUC2LSPQSXG7BQPRBXYOJZHE4TS===') % raw_input())) 
