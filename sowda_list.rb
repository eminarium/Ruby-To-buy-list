# Author : Merdan Durdyýew
# Github : https://github.com/eminarium
# Medium (Personal blog) : https://medium.com/@merdan.durdiyev
# Medium (Publication) : https://medium.com/kodeser
# Date : 11.09.2020

# Beýany: "SowdaList" - bazara söwda etmäge çykmazdan ozal alynmaly harytlaryň
# sanawyny düzmäge, alynan harytlary bolsa sanawdan bozmaga ýardam berýän,
# we birnäçe goşmaça funksionaly bolan programma.

# Description : "SowdaList" - a program that helps to note list of products to buy
# before going to shopping. We can also print the list and remove
# products already bought from the list.

class SowdaList
  attr_reader :ady

  # Sanawy başladýarys. /  We start the list.
  # Adyny berýäris we boş sanaw başladýarys. / We provide its name and start an empty list.
  def initialize(ady)
    @ady = ady
    @sanaw = []

    puts "#{@ady} atly sanaw başladyldy..."
  end

  # Sanawa parametr hökmünde berlen harydy goşýarys.
  # We add given product to the list.
  def gosh(haryt)
    @sanaw << haryt
    puts "#{haryt} sanawa goşuldy..."
  end

  # Tertip belgisi parametr hökmünde berlen harydy bozýarys.
  # Sanaw boş bolsa sanawyň boşdugy barada habar berýäris.
  # 'tertip_belgisi' sanawdaky haryt mukdaryndan köp bolsa,
  # ýa-da ol 1'dan kiçi baha deň bolsa onda degişli habarnama çykarýarys.
  def boz(tertip_belgisi)
    if @sanaw.empty?
      puts "Sanawda bozmaga hiç haryt ýok..."
    elsif (@sanaw.size < tertip_belgisi) or (tertip_belgisi < 1)
      puts "Sanawda berlen belgili haryt ýok..."
    else
      haryt = @sanaw[tertip_belgisi - 1]

      @sanaw.delete_at(tertip_belgisi - 1)
      puts "#{haryt} sanawdan bozuldy..."
    end
  end

  # Sanawy boşadýarys. / We empty the list.
  def boshat
    if @sanaw.empty?
      puts "Sanaw öňem boş..."
    else
      @sanaw.clear
      puts "Sanaw boşadyldy..."
    end
  end

  # Sanawa girizilen harytlary görkezýäris. / We print the elements list.
  # Sanaw boş bolsa sanawyň boşdugy barada habar berýäris. / If the list is empty we print the corresponding message.
  def sanaw_gorkez
    if @sanaw.empty?
      puts "Sanaw gynansagam boş ..."
    else
      puts "#########  #{@ady} - ALYNMALY HARYTLAR / Jemi : #{@sanaw.size} haryt bar ######### "
      @sanaw.each_with_index do |haryt, indeks|
        puts "#{indeks + 1} - #{haryt}"
      end
    end
  end

  # Sanawyň boşdugyny ýa däldigini anyklamak üçin metod.
  # A method to check whether the list is empty or not.
  def boshmy?
    @sanaw.empty?
  end
end

def yumushlary_gorkez
  puts "###### Ýumuşlar sanawy ######"
  puts "1 - Haryt goş"
  puts "2 - Harydy boz"
  puts "3 - Sanawy görkez"
  puts "4 - Sanawy boşat"
  puts "5 - Programmadan çyk"
  print "Ýumuş saýlaň : "
end

puts "Söwda Sanawy Programmasyna Hoş Geldiňiz !"
print "Täze sanawyň adyny giriziň : "
sanaw_ady = gets.chomp
sanaw = SowdaList.new(sanaw_ady)
saylaw = -1

until saylaw == 5
  yumushlary_gorkez

  saylaw = gets.to_i

  case saylaw
    when 1
      print "Goşmaly harydyň adyny giriziň : "
      haryt = gets.chomp
      sanaw.gosh(haryt)
    when 2
      if sanaw.boshmy?
        puts "Sanaw ozalam boş..."
      else
        sanaw.sanaw_gorkez
        print "Bozmaly harydyň belgisini giriziň : "
        belgi = gets.to_i
        sanaw.boz(belgi)
      end
    when 3
      sanaw.sanaw_gorkez
    when 4
      sanaw.boshat
    when 5
      puts "Hoş Sagboluň !"
    else
      puts "Ýalňyş ýumuş ! Diňe 1-5 arasy saýlaw giriziň..."
  end

end
