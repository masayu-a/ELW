is_print = false
File.open("ELW-programme.md","r:utf-8").each_line do |line|
  line.chomp!
  if line =~ /####/
    if line =~ /発表/
      is_print = true
    else
      is_print = false
    end
  elsif line =~ /###/
    is_print = false
  else
    if is_print
      if line =~ /^\s\s\s\s/
      else
        if line =~ /^-/
          line =~ /^- ([\d:\-]+) (「.*」)(.*)/
          title = $2
          authors = $3
          puts 
          puts '\subsection*{\bf ' + title + '}'
          puts '\addcontentsline{toc}{subsection}{' + title + ' \\\\ ' + authors + '}'
          puts authors + ' \\\\ '
        elsif line =~ /^>/
          puts line.sub(/^>\s*/,"") + ' \\\\ '
        end
      end

    end
  end
end
