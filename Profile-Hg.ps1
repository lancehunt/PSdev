

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
  <title>
  lancehunt / Powershell / source &mdash; Bitbucket
</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="description" content="" />
  <meta name="keywords" content="" />
  <!--[if lt IE 9]>
  <script src="https://dwz7u9t8u8usb.cloudfront.net/m/424ef50dfe3d/js/lib/html5.js"></script>
  <![endif]-->

  <script>
    (function (window) {
      // prevent stray occurrences of `console.log` from causing errors in IE
      var console = window.console || (window.console = {});
      console.log || (console.log = function () {});

      var BB = window.BB || (window.BB = {});
      BB.debug = false;
      BB.cname = false;
      BB.CANON_URL = 'https://bitbucket.org';
      BB.MEDIA_URL = 'https://dwz7u9t8u8usb.cloudfront.net/m/424ef50dfe3d/';
      BB.user || (BB.user = {});
      BB.user.has = (function () {
        var betaFeatures = [];
        
        return function (feature) {
          return _.contains(betaFeatures, feature);
        };
      }());
      BB.repo || (BB.repo = {});
  
  
      BB.user.isAdmin = false
      BB.repo.id = 167495;
    
    
      BB.repo.slug = 'powershell';
    
    
      BB.repo.owner = {
        username: 'lancehunt'
      };
    
      // Coerce `BB.repo` to a string to get
      // "davidchambers/mango" or whatever.
      BB.repo.toString = function () {
        return this.owner.username + '/' + this.slug;
      }
    
      BB.changeset = '3975fd908c1b'
    
    
  
    }(this));
  </script>

  
    <link rel="stylesheet" href="https://dwz7u9t8u8usb.cloudfront.net/m/424ef50dfe3d/bun/css/bundle.css"/>
  

  <link rel="search" type="application/opensearchdescription+xml" href="/opensearch.xml" title="Bitbucket" />
  <link rel="icon" href="https://dwz7u9t8u8usb.cloudfront.net/m/424ef50dfe3d/img/logo_new.png" type="image/png" />
  <link type="text/plain" rel="author" href="/humans.txt" />


  
    <script src="https://dwz7u9t8u8usb.cloudfront.net/m/424ef50dfe3d/bun/js/bundle.js"></script>
  



</head>

<body class="">
  <script type="text/javascript">
    if (!RegExp(" AppleWebKit/").test(navigator.userAgent)) {
    $('body').addClass('non-webkit');
    }
  </script>
  <!--[if IE 8]>
  <script>jQuery(document.body).addClass('ie8')</script>
  <![endif]-->
  <!--[if IE 9]>
  <script>jQuery(document.body).addClass('ie9')</script>
  <![endif]-->

  <div id="wrapper">



  <div id="header-wrap">
    <div id="header">
    <ul id="global-nav">
      <li><a class="home" href="http://www.atlassian.com">Atlassian Home</a></li>
      <li><a class="docs" href="http://confluence.atlassian.com/display/BITBUCKET">Documentation</a></li>
      <li><a class="support" href="/support">Support</a></li>
      <li><a class="blog" href="http://blog.bitbucket.org">Blog</a></li>
      <li><a class="forums" href="http://groups.google.com/group/bitbucket-users">Forums</a></li>
    </ul>
    <a href="/" id="logo">Bitbucket by Atlassian</a>

    <div id="main-nav" class="clearfix">
    
      <ul class="clearfix">
        <li><a href="/features">Features</a></li>
        <li><a href="/plans">Pricing &amp; signup</a></li>
        <li><a href="/explore">Explore Bitbucket</a></li>
        <li><a href="/account/signin/?next=/lancehunt/powershell/src/3975fd908c1b/Profile-Hg.ps1">Log in</a></li>
        

<li class="search-box">
  
    <form action="/repo/all">
      <input type="search" results="5" autosave="bitbucket-explore-search"
             name="name" id="searchbox"
             placeholder="Find a project" />
  
  </form>
</li>

      </ul>
    
    </div>
    </div>
  </div>

    <div id="header-messages">
  
  
    
    
    
    
  

    
   </div>



    <div id="content">
      <div id="unnamed">
      
  
  





  <script>
    jQuery(function ($) {
        var cookie = $.cookie,
            cookieOptions, date,
            $content = $('#content'),
            $pane = $('#what-is-bitbucket'),
            $hide = $pane.find('[href="#hide"]').css('display', 'block').hide();

        date = new Date();
        date.setTime(date.getTime() + 365 * 24 * 60 * 60 * 1000);
        cookieOptions = { path: '/', expires: date };

        if (cookie('toggle_status') == 'hide') $content.addClass('repo-desc-hidden');

        $('#toggle-repo-content').click(function (event) {
            event.preventDefault();
            $content.toggleClass('repo-desc-hidden');
            cookie('toggle_status', cookie('toggle_status') == 'show' ? 'hide' : 'show', cookieOptions);
        });

        if (!cookie('hide_intro_message')) $pane.show();

        $hide.click(function (event) {
            event.preventDefault();
            cookie('hide_intro_message', true, cookieOptions);
            $pane.slideUp('slow');
        });

        $pane.hover(
            function () { $hide.fadeIn('fast'); },
            function () { $hide.fadeOut('fast'); });

      (function () {
        // Update "recently-viewed-repos" cookie for
        // the "repositories" drop-down.
        var
          id = BB.repo.id,
          cookieName = 'recently-viewed-repos_' + BB.user.id,
          rvr = cookie(cookieName),
          ids = rvr? rvr.split(','): [],
          idx = _.indexOf(ids, '' + id);

        // Remove `id` from `ids` if present.
        if (~idx) ids.splice(idx, 1);

        cookie(
          cookieName,
          // Insert `id` as the first item, then call
          // `join` on the resulting array to produce
          // something like "114694,27542,89002,84570".
          [id].concat(ids.slice(0, 4)).join(),
          {path: '/', expires: 1e6} // "never" expires
        );
      }());
    });
  </script>



  
  
  
  
  
    <div id="what-is-bitbucket" class="new-to-bitbucket">
      <h2>lancehunt <span id="slogan">is sharing code with you</span></h2>
      <img src="https://secure.gravatar.com/avatar/2ea619950f89e0a0a23edd318025dc3d?d=identicon&s=32" alt="" class="avatar" />
      <p>Bitbucket is a code hosting site. Unlimited public and private repositories. Free for small teams.</p>
      <div class="primary-action-link signup"><a href="/account/signup/?utm_source=internal&utm_medium=banner&utm_campaign=what_is_bitbucket">Try Bitbucket free</a></div>
      <a href="#hide" title="Don't show this again">Don't show this again</a>
    </div>
  


<div id="tabs">
  <ul class="tabs">
    <li>
      <a href="/lancehunt/powershell/overview">Overview</a>
    </li>

    <li>
      <a href="/lancehunt/powershell/downloads">Downloads (<span id="downloads-count">0</span>)</a>
    </li>

    

    <li>
      <a href="/lancehunt/powershell/pull-requests">Pull requests (0)</a>
    </li>

    <li class="selected">
      
        <a href="/lancehunt/powershell/src">Source</a>
      
    </li>

    <li>
      <a href="/lancehunt/powershell/changesets">Commits</a>
    </li>

    

    

    

    <li class="secondary">
      <a href="/lancehunt/powershell/descendants">Forks/queues (0)</a>
    </li>

    <li class="secondary">
      <a href="/lancehunt/powershell/zealots">Followers (<span id="followers-count">0</span>)</a>
    </li>
  </ul>
</div>


  <div class="repo-menu" id="repo-menu">
    <ul id="repo-menu-links">
    
      <li>
        <a href="/lancehunt/powershell/rss" class="rss" title="RSS feed for Powershell">RSS</a>
      </li>

      <li><a href="/lancehunt/powershell/fork" class="fork">fork</a></li>
      
        
          <li><a href="/lancehunt/powershell/hack" class="patch-queue">patch queue</a></li>
        
      
      <li>
        <a rel="nofollow" href="/lancehunt/powershell/follow" class="follow">follow</a>
      </li>
      
          
      
      
        <li class="get-source inertial-hover">
          <a class="source">get source</a>
          <ul class="downloads">
            
              
              <li><a rel="nofollow" href="/lancehunt/powershell/get/3975fd908c1b.zip">zip</a></li>
              <li><a rel="nofollow" href="/lancehunt/powershell/get/3975fd908c1b.tar.gz">gz</a></li>
              <li><a rel="nofollow" href="/lancehunt/powershell/get/3975fd908c1b.tar.bz2">bz2</a></li>
            
          </ul>
        </li>
      
    </ul>

  
    <ul class="metadata">
      
      
        <li class="branches inertial-hover">branches
          <ul>
            <li><a href="/lancehunt/powershell/src/3975fd908c1b">default</a>
              
              
            </li>
          </ul>
        </li>
      
      
      <li class="tags inertial-hover">tags
        <ul>
          <li><a href="/lancehunt/powershell/src/3975fd908c1b">tip</a>
            
            </li>
        </ul>
      </li>
     
     
    </ul>
  
</div>
<div class="repo-menu" id="repo-desc">
  
    <ul id="repo-menu-links-mini">
      <li><a rel="nofollow" class="compare-link"
             href="/lancehunt/powershell/compare/..xpando/powershell"
             title="Show changes between Powershell and Powershell"
             ></a></li>
      
  

      
      <li>
        <a href="/lancehunt/powershell/rss" class="rss" title="RSS feed for Powershell"></a>
      </li>

      <li><a href="/lancehunt/powershell/fork" class="fork" title="Fork"></a></li>
      
        
          <li><a href="/lancehunt/powershell/hack" class="patch-queue" title="Patch queue"></a></li>
        
      
      <li>
        <a rel="nofollow" href="/lancehunt/powershell/follow" class="follow">follow</a>
      </li>
      
          
      
    
      
        <li>
          <a class="source" title="Get source"></a>
          <ul class="downloads">
            
              
                <li><a rel="nofollow" href="/lancehunt/powershell/get/3975fd908c1b.zip">zip</a></li>
                <li><a rel="nofollow" href="/lancehunt/powershell/get/3975fd908c1b.tar.gz">gz</a></li>
                <li><a rel="nofollow" href="/lancehunt/powershell/get/3975fd908c1b.tar.bz2">bz2</a></li>
              
            
          </ul>
        </li>
      
    
    </ul>

    <h3 id="repo-heading">
      <a class="owner-username" href="/lancehunt">lancehunt</a> /
      <a class="repo-name" href="/lancehunt/powershell">Powershell</a>
    
      (fork of
      
        <a href="/xpando">xpando</a> /
      
      <a href="/xpando/powershell">powershell</a>)
    

    
      <ul id="fork-actions" class="button-group">
        <li><a rel="nofollow" class="icon compare-link"
               href="/lancehunt/powershell/compare/..xpando/powershell"
               >compare fork</a></li>
        
      </ul>
    
    </h3>


  <p class="repo-desc-description">Powershell scripts to help automate my daily development life as a C#, .NET, ASP.NET/MVC developer.</p>


  <div id="repo-desc-cloneinfo">Clone this repository (size: 129.7 MB):
    <a href="https://bitbucket.org/lancehunt/powershell" class="https">HTTPS</a> /
    <a href="ssh://hg@bitbucket.org/lancehunt/powershell" class="ssh">SSH</a>
    <pre id="clone-url-https">hg clone https://bitbucket.org/lancehunt/powershell</pre>
    <pre id="clone-url-ssh">hg clone ssh://hg@bitbucket.org/lancehunt/powershell</pre>
    
  </div>

  <a href="#" id="toggle-repo-content"></a>

  

</div>




      

  <div id="source-path">
    <h1>
      <a href="/lancehunt/powershell/src">Powershell</a> /

  
    
      Profile-Hg.ps1
    
  

    </h1>
  </div>


  
  <div id="source-view">
    <div class="header">
      <ul class="metadata">
        <li><code>3975fd908c1b</code></li>
        <li>53 loc</li>
        <li>1.5 KB</li>
      </ul>
      <ul class="source-view-links">
        
        <li><a id="embed-link" href="https://bitbucket.org/lancehunt/powershell/src/3975fd908c1b/Profile-Hg.ps1?embed=t">embed</a></li>
        
        <li><a href="/lancehunt/powershell/history/Profile-Hg.ps1">history</a></li>
        
        <li><a href="/lancehunt/powershell/annotate/3975fd908c1b/Profile-Hg.ps1">annotate</a></li>
        
        <li><a href="/lancehunt/powershell/raw/3975fd908c1b/Profile-Hg.ps1">raw</a></li>
        <li>
          <form action="/lancehunt/powershell/diff/Profile-Hg.ps1" class="source-view-form">
          
            <input type="hidden" name="diff2" value="c11563b6bcda" />
            <select name="diff1">
            
              
                <option value="c11563b6bcda">c11563b6bcda</option>
              
            
              
                <option value="70d74d10e514">70d74d10e514</option>
              
            
              
                <option value="865094645600">865094645600</option>
              
            
              
                <option value="d5416af7b06e">d5416af7b06e</option>
              
            
              
                <option value="f875b5c91c8e">f875b5c91c8e</option>
              
            
              
                <option value="39b4c6ae226c">39b4c6ae226c</option>
              
            
              
                <option value="6376568eef7c">6376568eef7c</option>
              
            
              
                <option value="821d69b07fb7">821d69b07fb7</option>
              
            
              
                <option value="1f4d981aa169">1f4d981aa169</option>
              
            
              
                <option value="387f44842b09">387f44842b09</option>
              
            
              
                <option value="36f73e63f392">36f73e63f392</option>
              
            
            </select>
            <input type="submit" value="diff" />
          
          </form>
        </li>
      </ul>
    </div>
  
    <div>
    <table class="highlighttable"><tr><td class="linenos"><div class="linenodiv"><pre><a href="#cl-1"> 1</a>
<a href="#cl-2"> 2</a>
<a href="#cl-3"> 3</a>
<a href="#cl-4"> 4</a>
<a href="#cl-5"> 5</a>
<a href="#cl-6"> 6</a>
<a href="#cl-7"> 7</a>
<a href="#cl-8"> 8</a>
<a href="#cl-9"> 9</a>
<a href="#cl-10">10</a>
<a href="#cl-11">11</a>
<a href="#cl-12">12</a>
<a href="#cl-13">13</a>
<a href="#cl-14">14</a>
<a href="#cl-15">15</a>
<a href="#cl-16">16</a>
<a href="#cl-17">17</a>
<a href="#cl-18">18</a>
<a href="#cl-19">19</a>
<a href="#cl-20">20</a>
<a href="#cl-21">21</a>
<a href="#cl-22">22</a>
<a href="#cl-23">23</a>
<a href="#cl-24">24</a>
<a href="#cl-25">25</a>
<a href="#cl-26">26</a>
<a href="#cl-27">27</a>
<a href="#cl-28">28</a>
<a href="#cl-29">29</a>
<a href="#cl-30">30</a>
<a href="#cl-31">31</a>
<a href="#cl-32">32</a>
<a href="#cl-33">33</a>
<a href="#cl-34">34</a>
<a href="#cl-35">35</a>
<a href="#cl-36">36</a>
<a href="#cl-37">37</a>
<a href="#cl-38">38</a>
<a href="#cl-39">39</a>
<a href="#cl-40">40</a>
<a href="#cl-41">41</a>
<a href="#cl-42">42</a>
<a href="#cl-43">43</a>
<a href="#cl-44">44</a>
<a href="#cl-45">45</a>
<a href="#cl-46">46</a>
<a href="#cl-47">47</a>
<a href="#cl-48">48</a>
<a href="#cl-49">49</a>
<a href="#cl-50">50</a>
<a href="#cl-51">51</a>
<a href="#cl-52">52</a>
</pre></div></td><td class="code"><div class="highlight"><pre><a name="cl-1"></a>$global:profile = $MyInvocation.MyCommand.Definition
<a name="cl-2"></a>$profileDir = Split-Path -Parent $profile
<a name="cl-3"></a>Push-Location $profileDir
<a name="cl-4"></a>
<a name="cl-5"></a>Import-Module &quot;$profileDir\Modules\Commands&quot;
<a name="cl-6"></a>Import-Module &quot;$profileDir\Modules\PoshHg\Posh-Hg&quot;
<a name="cl-7"></a>Import-Module &quot;$profileDir\Modules\PSake\Psake&quot;
<a name="cl-8"></a>
<a name="cl-9"></a>Add-Path @(
<a name="cl-10"></a>  &quot;$profileDir\Scripts&quot;
<a name="cl-11"></a>  &quot;$profileDir\Tools&quot;
<a name="cl-12"></a>  &quot;$profileDir\Tools\tcc&quot; 
<a name="cl-13"></a>  &quot;$profileDir\Tools\TortoiseHg&quot;
<a name="cl-14"></a>)
<a name="cl-15"></a>
<a name="cl-16"></a># Set up a simple prompt, adding the hg prompt parts inside hg repos
<a name="cl-17"></a>function prompt {
<a name="cl-18"></a>    # Mercurial Prompt
<a name="cl-19"></a>    $Global:HgStatus = Get-HgStatus
<a name="cl-20"></a>    Write-HgStatus $HgStatus
<a name="cl-21"></a>
<a name="cl-22"></a>    $q = Split-Path $pwd -Qualifier
<a name="cl-23"></a>    $p = Split-Path $pwd -NoQualifier
<a name="cl-24"></a>
<a name="cl-25"></a>    Write-Host($q) -nonewline -foregroundcolor green
<a name="cl-26"></a>    Write-Host($p) -nonewline -foregroundcolor white
<a name="cl-27"></a>    Write-Host(&quot;►&quot;) -nonewline -foregroundcolor red
<a name="cl-28"></a>      
<a name="cl-29"></a>    return &quot; &quot;
<a name="cl-30"></a>}
<a name="cl-31"></a>
<a name="cl-32"></a>if(-not (Test-Path Function:\DefaultTabExpansion)) {
<a name="cl-33"></a>    Rename-Item Function:\TabExpansion DefaultTabExpansion
<a name="cl-34"></a>}
<a name="cl-35"></a>
<a name="cl-36"></a># Set up tab expansion and include hg expansion
<a name="cl-37"></a>function TabExpansion($line, $lastWord) {
<a name="cl-38"></a>    $lastBlock = [regex]::Split($line, &#39;[|;]&#39;)[-1]
<a name="cl-39"></a>    
<a name="cl-40"></a>    switch -regex ($lastBlock) {
<a name="cl-41"></a>        # mercurial and tortoisehg tab expansion
<a name="cl-42"></a>        &#39;(hg|thg) (.*)&#39; { HgTabExpansion($lastBlock) }
<a name="cl-43"></a>        # Fall back on existing tab expansion
<a name="cl-44"></a>        default { DefaultTabExpansion $line $lastWord }
<a name="cl-45"></a>    }
<a name="cl-46"></a>}
<a name="cl-47"></a>
<a name="cl-48"></a>$global:HgPromptSettings.BeforeText = &#39; in &#39;
<a name="cl-49"></a>$global:HgPromptSettings.BeforeForegroundColor = [ConsoleColor]::White
<a name="cl-50"></a>$global:HgPromptSettings.BeforeTagText = &#39; at &#39;
<a name="cl-51"></a>
<a name="cl-52"></a>Pop-Location
</pre></div>
</td></tr></table>
    </div>
  
  </div>
  



      </div>
    </div>

  </div>

  <div id="footer">
    <ul id="footer-nav">
      <li>Copyright © 2011 <a href="http://atlassian.com">Atlassian</a></li>
      <li><a href="http://www.atlassian.com/hosted/terms.jsp">Terms of Service</a></li>
      <li><a href="http://www.atlassian.com/about/privacy.jsp">Privacy</a></li>
      <li><a href="//bitbucket.org/site/master/issues/new">Report a Bug to Bitbucket</a></li>
      <li><a href="http://confluence.atlassian.com/x/IYBGDQ">API</a></li>
      <li><a href="http://status.bitbucket.org/">Server Status</a></li>
    </ul>
    <ul id="social-nav">
      <li class="blog"><a href="http://blog.bitbucket.org">Bitbucket Blog</a></li>
      <li class="twitter"><a href="http://www.twitter.com/bitbucket">Twitter</a></li>
    </ul>
    <h5>We run</h5>
    <ul id="technologies">
      <li><a href="http://www.djangoproject.com/">Django 1.3.0</a></li>
      <li><a href="//bitbucket.org/jespern/django-piston/">Piston 0.3dev</a></li>
      <li><a href="http://www.selenic.com/mercurial/">Hg 1.9.2</a></li>
      <li><a href="http://www.python.org">Python 2.7.2</a></li>
      <li>r12465:0ecc43e9a8ca | bitbucket03</li>
    </ul>
  </div>

  <script src="https://dwz7u9t8u8usb.cloudfront.net/m/424ef50dfe3d/js/lib/global.js"></script>






  <script>
    BB.gaqPush(['_trackPageview']);
  
    BB.gaqPush(['atl._trackPageview']);

    

    

    (function () {
        var ga = document.createElement('script');
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        ga.setAttribute('async', 'true');
        document.documentElement.firstChild.appendChild(ga);
    }());
  </script>

</body>
</html>
