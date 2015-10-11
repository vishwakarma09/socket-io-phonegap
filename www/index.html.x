<!DOCTYPE html>
<!--
    Copyright (c) 2012-2014 Adobe Systems Incorporated. All rights reserved.

    Licensed to the Apache Software Foundation (ASF) under one
    or more contributor license agreements.  See the NOTICE file
    distributed with this work for additional information
    regarding copyright ownership.  The ASF licenses this file
    to you under the Apache License, Version 2.0 (the
    "License"); you may not use this file except in compliance
    with the License.  You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
     KIND, either express or implied.  See the License for the
    specific language governing permissions and limitations
    under the License.
-->
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="format-detection" content="telephone=no" />
        <meta name="msapplication-tap-highlight" content="no" />
        <!-- WARNING: for iOS 7, remove the width=device-width and height=device-height attributes. See https://issues.apache.org/jira/browse/CB-4323 -->
        <meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width, height=device-height, target-densitydpi=device-dpi" />
        <link rel="stylesheet" type="text/css" href="css/index.css" />
        <title>Pingu chat</title>
				
				<style>
					* { margin: 0; padding: 0; box-sizing: border-box; }
					body { font: 13px Helvetica, Arial; }
					form { background: #000; padding: 3px; position: fixed; bottom: 0; width: 100%; }
					form input { border: 0; padding: 10px; width: 90%; margin-right: .5%; }
					form button { width: 9%; background: rgb(130, 224, 255); border: none; padding: 10px; }
					#messages { list-style-type: none; margin: 0; padding: 0; }
					#messages li { padding: 5px 10px; }
					#messages li:nth-child(odd) { background: #eee; }
				</style>
    </head>
    <body>
        <script type="text/javascript" src="cordova.js"></script>
    <!--    <script type="text/javascript" src="js/index.js"></script>
		-->
        <script type="text/javascript">
            app.initialize();
						
						 var socket = io.connect('http://52.18.12.164:8080/');
							$('form').submit(function(){
								socket.emit('chat message', $('#m').val());
								$('#m').val('');
								return false;
							});
							socket.on('chat message', function(msg){
								$('#messages').append($('<li>').text(msg));
							});
        </script>
				
				<ul id="messages"></ul>
				<form action="">
					<input id="m" autocomplete="off" /><button>Send</button>
				</form>
			<script src="https://cdn.socket.io/socket.io-1.2.0.js"></script>
			<script src="http://code.jquery.com/jquery-1.11.1.js"></script>
    </body>
</html>
