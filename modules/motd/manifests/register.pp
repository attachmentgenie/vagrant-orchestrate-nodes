define motd::register($content="", $order=10) {
   if $content == "" {
      $body = $name
   } else {
      $body = $content
   }

   concat::fragment{"motd_fragment_$name":
      target  => "/etc/motd.tail",
      content => "    -- $body\n"
   }
}