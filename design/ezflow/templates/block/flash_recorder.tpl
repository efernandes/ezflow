{def $valid_node = $block.valid_nodes[0]}

{* Define default settings for the broadcaster flash *}
{def $width=269
     $height=213
     $flash='flash/streaming.swf'|ezdesign(no)
     $fileserver=$valid_node.object.data_map.file_server.content
     $streamserver=$valid_node.object.data_map.stream_server.content
     $key=$valid_node.object.data_map.key.content
     $flash_list=red5list( $fileserver, $key )
     $flash_var=concat( "streamserver=", $streamserver )}
{set $flash_var=$flash_var|append( "&amp;fileserver=", $fileserver )}

{foreach $flash_list as $name => $item max 1}
    {set $flash_var=$flash_var|append( "&amp;moviepath=", $item.absoluteURL )}
{/foreach}

<div class="block-type-video">

    <div class="attribute-header">
        <h2>{$block.name}</h2>
    </div>
    
    <div class="content-media" id="flash-{$block.zone_id}-{$block.id}">
        <script type="text/javascript">
        <!--
            var flash_id="flash-{$block.zone_id}-{$block.id}";
        
            var flashString = '<object type="application/x-shockwave-flash" data="{$flash}" width="{$width}" height="{$height}"> ';
            flashString += '<param name="movie" value="{$flash}" /> ';
            flashString += '<param name="scale" value="exactfit" /> ';
            flashString += '<param name="wmode" value="opaque" />' ;
            flashString += '<param name="allowScriptAccess" value="sameDomain" />';
            flashString += '<param name="allowFullScreen" value="true" />';
            flashString += '<param name="bgcolor" value="#ffffff" />' ;
            flashString += '<param name="quality" value="high" />' ;
            flashString += '<param name="flashvars" value="{$flash_var}" />';
            flashString += '<p>No <a href="http://www.macromedia.com/go/getflashplayer">Flash player</a> avaliable!</p>';
            flashString += '</object>' ;
            
            insertMedia2( flash_id, flashString );            
        //-->
        </script>

        <noscript>
        <object type="application/x-shockwave-flash" data="{$flash}" width="{$width}" height="{$height}">          
            <param name="movie" value="{$flash}" />
            <param name="scale" value="exactfit" />
            <param name="wmode" value="opaque" />
            <param name="allowScriptAccess" value="sameDomain" />
            <param name="bgcolor" value="#ffffff" />
            <param name="allowFullScreen" value="false" />
            <param name="quality" value="high" />
            <param name="flashvars" value="{$flash_var}" />
            <p>No <a href="http://www.macromedia.com/go/getflashplayer">Flash player</a> avaliable!</p>
        </object>
        </noscript>
    </div>
    
    <div class="block">
        {if $flash_list}
            <h2>Recorded videos</h2>
            <ul>
                {foreach $flash_list as $name => $item}
                    <li><a href={concat( $valid_node.url_alias, "/(video)/", $name|wash )|ezurl}>{$name|wash}</a></li>
                {/foreach}            
            </ul>
        {/if}
    </div>
    
    
</div>