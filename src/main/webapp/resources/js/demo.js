var rangeText = function (start, end) {
        var str = '';
        str += start ? start.format('YY/MM/DD') + ' to ' : '';
        str += end ? end.format('YY/MM/DD') : '...';

        return str;
    },
    css = function(url){
        var head  = document.getElementsByTagName('head')[0];
        var link  = document.createElement('link');
        link.rel  = 'stylesheet';
        link.type = 'text/css';
        link.href = url;
        head.appendChild(link);
    },
    script = function (url) {
        var s = document.createElement('script');
        s.type = 'text/javascript';
        s.async = true;
        s.src = url;
        var head  = document.getElementsByTagName('head')[0];
        head.appendChild(s);
    }
    callbackJson = function(json){
        var id = json.files[0].replace(/\D/g,'');
        document.getElementById('gist-' + id).innerHTML = json.div;

        if (!document.querySelector('link[href="' + json.stylesheet  + '"]')) {
            css(json.stylesheet);
        }
    };


window.onload = function () {
    var gists = [
        'https://gist.github.com/wakirin/c0100ee7e886fe74b3256ddb74f16adf.json?callback=callbackJson',
        'https://gist.github.com/wakirin/d4f00465b259590233f0727f01eaba66.json?callback=callbackJson',
        'https://gist.github.com/wakirin/c4e84bf9c5546a9656337236491a75f6.json?callback=callbackJson',
        'https://gist.github.com/wakirin/cdc9423464346f2de381cb3df0c78860.json?callback=callbackJson',
        'https://gist.github.com/wakirin/917c0e596078c1fcf51bff945004a4f2.json?callback=callbackJson',
        'https://gist.github.com/wakirin/4b9917aa9bda42f25124875c91385c7f.json?callback=callbackJson',
        'https://gist.github.com/wakirin/8782b1f9e3580a26fb70cdc78c4ed6d3.json?callback=callbackJson',
        'https://gist.github.com/wakirin/a76eaf1f7860aa0add9ba384bec8e0aa.json?callback=callbackJson',
        'https://gist.github.com/wakirin/b526e49275dc02c4ab3f3b72c3f0f3af.json?callback=callbackJson',
        'https://gist.github.com/wakirin/8fdf443726f097326d927e0e85dbc5dd.json?callback=callbackJson',
        'https://gist.github.com/wakirin/a10bbe7a2d22d1c285cd4763e4a5de80.json?callback=callbackJson',
    ];
    
    if (!window.location.href.startsWith('file')) {
        gists.forEach(function(entry, key){
            script(entry);
        });
    }
};

/**
 * 
 * @param date_range ( String ex)"20/10/07 to 20/10/08" )
 * @returns [0] = startDate, [1] = endDate
 */
function splitDate(date_range){
	let date_arr = date_range.split('to');
	for(let i=0; i<date_arr.length; i++){
		date_arr[i] = date_arr[i].trim();
	}
	return date_arr;
}

// demo-2
new Lightpick({
    field: document.getElementById('demo-2'),
    singleDate: false,
    onSelect: function(start, end){
        document.getElementById('result-2').innerHTML = rangeText(start, end);
    }
});
