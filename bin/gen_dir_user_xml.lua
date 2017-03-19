-- gen_dir_user_xml.lua
-- example script for generating user directory XML
 
-- comment the following line for production:
--freeswitch.consoleLog("notice", "Debug from gen_dir_user_xml.lua, provided params:\n" .. params:serialize() .. "\n")
 
local req_domain = params:getHeader("domain")
local req_key    = params:getHeader("key")
local req_user   = params:getHeader("user")
local password   = "1234"
--assert (req_domain and req_key and req_user,
--"This example script only supports generating directory xml for a single user !\n")
if req_domain ~= nil and req_key~=nil and req_user~=nil then
    XML_STRING =
    [[<?xml version="1.0" encoding="UTF-8" standalone="no"?>
    <document type="freeswitch/xml">
      <section name="directory">
        <domain name="]]..req_domain..[[">
          <params>
        <param name="dial-string"
        value="{presence_id=${dialed_user}@${dialed_domain}}${sofia_contact(${dialed_user}@${dialed_domain})}"/>
          </params>
          <groups>
        <group name="default">
          <users>
            <user id="]] ..req_user..[[">
              <params>
            <param name="password" value="]]..password..[["/>
            <param name="vm-password" value="]]..password..[["/>
              </params>
              <variables>
            <variable name="toll_allow" value=""/>
            <variable name="accountcode" value="]] ..req_user..[["/>
            <variable name="user_context" value="default"/>
            <variable name="directory-visible" value="true"/>
            <variable name="directory-exten-visible" value="true"/>
            <variable name="limit_max" value="15"/>
              </variables>
            </user>
          </users>
        </group>
          </groups>
        </domain>
      </section>
    </document>]]
else
    XML_STRING =
    [[<?xml version="1.0" encoding="UTF-8" standalone="no"?>
    <document type="freeswitch/xml">
      <section name="directory">
      </section>
    </document>]]
end
 
  -- comment the following line for production:
  --freeswitch.consoleLog("notice", "Debug from gen_dir_user_xml.lua, generated XML:\n" .. XML_STRING .. "\n")
