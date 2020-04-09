#!/bin/sh
# Copyright 2020 Kaan Karakaya
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


HTPASSWD=$1
USERNAME=$2
PASSWORD=$3

ENTRY=`cat $HTPASSWD | grep "^$USERNAME:"`
HASH=`echo $ENTRY | cut -f 2 -d :`
SALT=`echo $HASH | cut -f 3 -d $`
RESULT=`openssl passwd -apr1 -salt $SALT $PASSWORD`

echo "File: $HTPASSWD"
echo "Username: $USERNAME"
echo "Entry: $ENTRY"
echo "Hash: $HASH"
echo "Salt: $SALT"

echo "password to check: $PASSWORD"
echo "openssl result: $RESULT"

if [ $RESULT = $HASH ]
then
  echo "OKAY"
else
  echo "NOT MATCHED"
fi