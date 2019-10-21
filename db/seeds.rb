# This file should contain all the record creation needed to
# seed the database with its default values.
# The data can then be loaded with the rails db:seed command
# (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' },
#   { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Book.create!([
#                { title: '冷战在亚洲',
#                  subheading: '朝鲜��争���中国出兵朝鲜',
#                  series_name: '冷战国际史研究文库',
#                  author: '沈志华',
#                  publisher: '九州出版社',
#                  pub_year: '2012',
#                  pub_date: '2012-12-22',
#                  edit_num: '1',
#                  page: '519',
#                  isbn: '9787510814983',
#                  price: 78.00,
#                  rate: '7.8',
#                  rate_num: '64',
#                  copy: 3,
#                  image: File.open(Rails.root + 'public/uploads/image/47.jpg'),
#                  description: '冷战在亚洲：朝鲜战争与中国出兵朝鲜，ISBN：9787510814983，作者：沈志华 著' },
#
#                { title: '抗日战争',
#                  subheading: '第一卷 1937年7月-1938年8月',
#                  series_name: '王树增战争系列',
#                  author: '王树增',
#                  publisher: '人民文学出版社',
#                  pub_date: '2015-7-1',
#                  pub_year: '2015',
#                  edit_num: '1',
#                  page: '588',
#                  isbn: '9787020110032',
#                  price: '66.00',
#                  rate: '8.6',
#                  rate_num: '333',
#                  copy: 4,
#                  image: File.open(Rails.root + 'public/uploads/image/21.jpg'),
#                  description: '《抗日战争（第一卷 1937年7月-1938年8月） 》王树增战争系列作品登顶之作！
#                  七十年，第一部属于全民族的《抗日战争》
#                  《抗日战争（第一卷 1937年7月-1938年8月） 》以三卷的恢宏篇幅记述了发生在二十世纪三四十年代的抗日战争。作品以战争的每一次事��和每一场战役为纵贯，以第二世界大战的国际视角全面真实地揭示了中华民族在近代历史中第一次全民同仇敌忾、浴血山河所赢得的伟大的反侵略战争的胜利。《抗日战争》是一次全新写作，全新阅读战争的体验，对抗日战争全新定位和见识的巨著。从史料收集和研读开始，《抗日战争（第一卷 1937年7月-1938年8月） 》写作长达六年之久。由于战场广阔���参战人数众多，抗日战争亲历者遍布各地。尽管如此，王树增还是尽可能地查阅文献、踏勘战场、采集、比对、甄别，力求真实。经过海量阅读和精心酝酿，最后完成了这部大书。\r\n
#                  《抗日战争（第一卷 1937年7月-1938年8月） 》站在全民族抗战的立场上，在世界反法西斯战争的大背景下，以重大战役战斗为轴，以重大历事件及相关人物为经纬，突出反映并全景式地记叙1937—1945年这八年抗战中的主要战役战斗。对敌我双方统帅部的战役企图、计划，兵力部署，作战行动和战役经过，都做了详尽的记叙，特����是对��役战斗结局及其经验教训，能从军事学术的高度给以分析、总结与点评。\r\n
#                  这部作品以波澜壮阔的文学叙述向最广大的读者解读中日之间为什么会发生如此持久的战争。记录了中华民族在山河破碎、艰难困苦、牺牲巨大的历史现实下如何同�����浴血奋战，最终赢得�����场伟���的民族战争。对于这场残酷的战争所揭示的历史经验和教训，对于广大读者认识战争的本质在实践民族复兴伟业的今日中��，都有着巨大的认知意义和价值。
#                  全面讲述抗日战争历史，是历史的需要，也是现实的可能。随着社会日益开放，对外交流通畅，两岸对历史的日趋一致，尘封已久的秘密文书档案也纷纷解密。有太多读者希望全面了解抗日战争的历史，有太多他们的父辈曾亲身经历的战争需要重新讲述。\r\n
#                  此时回首上世纪的抗日战争，创作一部符合历史真实的巨著，便既是应当的，也是可能的了。王树增的“战争系列”一直在努力达到这一目标，这也是他的“战争写作”的价值所在。正是基于此，王树增完成了他“战争系列”最为宏阔的一部作品——《抗日战争（第一卷 1937年7月-1938年8月） 》' },
#                { title: '论中国',
#                  subheading: '',
#                  series_name: '',
#                  author: '[美]基辛格',
#                  publisher: '中信出版社',
#                  original_name: 'On China',
#                  translator: '胡利平 / 林华 / 杨韵琴 / 朱敬文',
#                  format: '精装',
#                  pub_date: '2012-10-01',
#                  pub_year: '2012',
#                  edit_num: '',
#                  page: '648',
#                  isbn: '9787508635583',
#                  price: '68',
#                  rate: '8.6',
#                  rate_num: '7115',
#                  copy: 1,
#                  image: File.open(Rails.root + 'public/uploads/image/61.jpg'),
#                  description: '亨利•基辛格唯一一部中国问题专著，完美收官
#                   用国际视角、世界眼光，重新解读中��的过去、现在与未来
#                   他写到了中国历史的泪点，他触到了中国人民的痛处，' }
#              ])

# Book.create!(title: '',
#              subheading: '',
#              series_name: '',
#              author: '',
#              publisher: '',
#              pub_date: '',
#              pub_year: '',
#              edit_num: '',
#              page: '',
#              isbn: '',
#              price: '',
#              rate: '',
#              rate_num: '',
#              description: '')
# Book.create!(title: '',
#              subheading: '',
#              series_name: '',
#              author: '',
#              publisher: '',
#              pub_date: '',
#              pub_year: '',
#              edit_num: '',
#              page: '',
#              isbn: '',
#              price: '',
#              rate: '',
#              rate_num: '',
#              description: '')
# Book.create!(title: '',
#              subheading: '',
#              series_name: '',
#              author: '',
#              publisher: '',
#              pub_date: '',
#              pub_year: '',
#              edit_num: '',
#              page: '',
#              isbn: '',
#              price: '',
#              rate: '',
#              rate_num: '',
#              description: '')
#
Issue.create!([{
                magazine_id: 1,
                year: 2018,
                issue_num: 1,
                barcode: 'sl201801',
                cover: File.open(Rails.root + 'public/uploads/image/sl201801.jpeg')
              }, {
                magazine_id: 1,
                year: 2018,
                issue_num: 2,
                barcode: 'sl201802',
                cover: File.open(Rails.root + 'public/uploads/image/sl201802.jpeg')
              }, {
                magazine_id: 1,
                year: 2018,
                issue_num: 3,
                barcode: 'sl201803',
                cover: File.open(Rails.root + 'public/uploads/image/sl201803.jpeg')
              }, {
                magazine_id: 1,
                year: 2018,
                issue_num: 4,
                barcode: 'sl201804',
                cover: File.open(Rails.root + 'public/uploads/image/sl201804.jpeg')
              }, {
                magazine_id: 1,
                year: 2018,
                issue_num: 5,
                barcode: 'sl201805',
                cover: File.open(Rails.root + 'public/uploads/image/sl201805.jpeg')
              }, {
                magazine_id: 1,
                year: 2018,
                issue_num: 6,
                barcode: 'sl201806',
                cover: File.open(Rails.root + 'public/uploads/image/sl201806.jpeg')
              }, {
                magazine_id: 1,
                year: 2018,
                issue_num: 7,
                barcode: 'sl201807',
                cover: File.open(Rails.root + 'public/uploads/image/sl201807.jpeg')
              }, {
                magazine_id: 1,
                year: 2018,
                issue_num: 8,
                barcode: 'sl201808',
                cover: File.open(Rails.root + 'public/uploads/image/sl201808.jpeg')
              }, {
                magazine_id: 1,
                year: 2018,
                issue_num: 9,
                barcode: 'sl201809',
                cover: File.open(Rails.root + 'public/uploads/image/sl201809.jpeg')
              }, {
                magazine_id: 1,
                year: 2018,
                issue_num: 1,
                barcode: 'sl201801',
                cover: File.open(Rails.root + 'public/uploads/image/sl201801.jpeg')
              }, {
                magazine_id: 1,
                year: 2018,
                issue_num: 10,
                barcode: 'sl201810',
                cover: File.open(Rails.root + 'public/uploads/image/sl201810.jpeg')
              }, {
                magazine_id: 1,
                year: 2018,
                issue_num: 10,
                barcode: 'sl201810',
                cover: File.open(Rails.root + 'public/uploads/image/sl201810.jpeg')
              }, {
                magazine_id: 1,
                year: 2018,
                issue_num: 11,
                barcode: 'sl201811',
                cover: File.open(Rails.root + 'public/uploads/image/sl201811.jpeg')
              }, {
                magazine_id: 1,
                year: 2018,
                issue_num: 12,
                barcode: 'sl201812',
                cover: File.open(Rails.root + 'public/uploads/image/sl201812.jpeg')
              }, {
                magazine_id: 1,
                year: 2018,
                issue_num: 13,
                barcode: 'sl201813',
                cover: File.open(Rails.root + 'public/uploads/image/sl201813.jpeg')
              }, {
                magazine_id: 1,
                year: 2014,
                issue_num: 10,
                barcode: 'sl201410',
                cover: File.open(Rails.root + 'public/uploads/image/sl201410.jpeg')
              }, {
                magazine_id: 1,
                year: 2015,
                issue_num: 0o1,
                barcode: 'sl201501',
                cover: File.open(Rails.root + 'public/uploads/image/sl201501.jpeg')
              }, {
                magazine_id: 1,
                year: 2016,
                issue_num: 2,
                barcode: 'sl201602',
                cover: File.open(Rails.root + 'public/uploads/image/sl201602.jpeg')
              }, {
                magazine_id: 1,
                year: 2016,
                issue_num: 52,
                barcode: 'sl201652',
                cover: File.open(Rails.root + 'public/uploads/image/sl201652.jpeg')
              }, {
                magazine_id: 1,
                year: 2017,
                issue_num: 1,
                barcode: 'sl201701',
                cover: File.open(Rails.root + 'public/uploads/image/sl201701.jpeg')
              }, {
                magazine_id: 1,
                year: 2017,
                issue_num: 11,
                barcode: 'sl201711',
                cover: File.open(Rails.root + 'public/uploads/image/sl201711.jpeg')
              }, {
                magazine_id: 1,
                year: 2017,
                issue_num: 44,
                barcode: 'sl201744',
                cover: File.open(Rails.root + 'public/uploads/image/sl201744.jpeg')
              }, {
                magazine_id: 1,
                year: 2017,
                issue_num: 52,
                barcode: 'sl201752',
                cover: File.open(Rails.root + 'public/uploads/image/sl201752.jpeg')
              }])
# Magazine.create!([{
#                    title: '三联生活周刊',
#                    management: '中国出版集团',
#                    editor: '朱伟',
#                    publisher: '三联生活周刊',
#                    created_year: '1995',
#                    cn_num: 'CN11-3221/C',
#                    issn: '9771005360000',
#                    pub_cycle: '周刊',
#                    pub_period: '每星期一',
#                    year_issue: '52',
#                    per_price: 15,
#                    year_price: 780,
#                    page: 168,
#                    source: '邮局订阅',
#                    copy: 1,
#                    image: File.open(Rails.root + 'public/uploads/image/sl.jpeg'),
#                    description: '《三联生活周刊》由中国出版集团下属的生活•读书•新知三联书店主办，是一份具有良好的声誉，在主流人群中有着广泛影响力的综合性新闻和文化类周刊。
#                    《三联生活周刊》以最快速度追踪热点新闻���更多关注新时代中的新生活观，以独特的视角、深度的思考和一贯秉持人文情怀，为读者忠实记录着世界和中国发生的变化，一本杂志和他倡导的生活 已被越来越多的人所认可。'
#                  }, {
#                    title: '南风窗',
#                    publisher: '南风窗',
#                    pub_addr: '广东',
#                    created_year: '1985',
#                    cn_num: 'CN44-1019/GZ',
#                    issn: '9771004044077',
#                    pub_cycle: '半月刊',
#                    year_issue: 24,
#                    per_price: 15,
#                    year_price: 360,
#                    page: 96,
#                    format: '16开',
#                    source: '邮局订阅',
#                    copy: 2,
#                    image: File.open(Rails.root + 'public/uploads/image/nf.jpeg'),
#                    description: '中国最具影响力的新闻杂志——《南风窗》
#
#                    《南风窗》杂志1985年创刊。二十多年来一直坚持严肃的新闻理念，敏锐而深刻的新闻价值探索与判断，强调建设性与分寸感的务实新闻操作，形成了特有的品质和气质，形成了对社会问题特有的解读和视角，形成了特有的文采风格，因而，吸引了中国社会的主流人群，并得到读者认可，巳经成为中国最具影响力的新闻杂志。《南风窗》与共和国同行，深切关注中国社会的转型问题，以开放的心态透视全球化背景下的世界形势，紧密追踪中国政经领域和社会文化变革中的重大事件、热点难点、汇聚主流精英和人民大众的声音，提供有建设性的思考，形成推动中国社会前行的精神合力。
#
#                    《南风窗》是由中共广州市委领导亲自批准创办的时事���治类综合月刊。自1985年4月创刊以来，依托改革开放的前沿阵地，通过架设理论与实践、政治和经济、领导者和被领导者、几代人之间的桥梁，宣传新观念、揭示新趋势、扶持新事物、促进新潮流，成为广东期刊界的一面旗帜，被誉为“刊林奇葩”。',
#                    status: ''
#                  }, {
#                    title: '环球人物',
#                    management: '人民日报社',
#                    publisher: '人民日报社',
#                    cn_num: 'CN11-5490/C',
#                    issn: '9776675617523',
#                    pub_cycle: '半月刊',
#                    year_issue: 24,
#                    per_price: 15,
#                    year_price: 360,
#                    page: 96,
#                    copy: 3,
#                    image: File.open(Rails.root + 'public/uploads/image/rw.jpeg'),
#                    description: '《环球人物》由人民日报社主办，是中国第一份具有全球视野的人物类期刊。
#
#                    《环球人物》由人民日报社主管、主办，是国内最权威、最可读的人物期刊。依托人民日报和环球时报的资源优势，《环球人物》300余位国内外记者��踪报道世界政治、经济、科技、文化、社会等各个领域热点人物，为读者反映全球时事，解读人生智慧，揭示成功秘诀，讲述他们背后的故事。'
#
#                  }, {
#                    title: '现代兵器',
#                    publisher: '现代兵器',
#                    cn_num: 'CN11-1761/TJ',
#                    issn: '9787540852948',
#                    pub_cycle: '月刊',
#                    pub_period: '',
#                    year_issue: 12,
#                    per_price: 15,
#                    year_price: 180,
#                    page: 70,
#                    format: '16开',
#                    copy: 5,
#                    image: File.open(Rails.root + 'public/uploads/image/bq.jpeg'),
#                    description: '杂志融技术性、知识性和趣味性于一体，向广大读者展示了一个丰富多彩的兵��天地。
#
#                    《现代兵器》是中国兵器工业情报研究所主办的一本综合性军事科技月刊，其宗旨是使读者全面、系统、及时、准确地了解世界各国、各地区三军装备及其技术的现状及未来发展。'
#                  }, {
#                    title: '现代舰船',
#                    subheading: 'Ｂ版',
#                    management: '中国船舶重工集团公司',
#                    publisher: '现代舰船杂志社',
#                    created_year: '1963',
#                    cn_num: 'CN11-1884/U',
#                    issn: '1672-7649',
#                    pub_cycle: '月刊',
#                    pub_period: '',
#                    year_issue: 12,
#                    per_price: 15,
#                    year_price: 780,
#                    page: 63,
#                    copy: 1,
#                    image: File.open(Rails.root + 'public/uploads/image/jc.jpeg'),
#                    description: '《现代舰船》杂志由国家科学技术部，新闻出版总署批准开办，由中国著名的舰船科研和生产集团--中国船舶重工集团公司主管，中国知名舰船科研支撑机构--中国船舶信息中心主办，是由中国舰船类期刊专业出版机构--现代舰船杂志社承办其编辑、出版和全国范围内的发行工作的国防科工委重点刊物之一。'
#                  }, {
#                    title: '看天下',
#                    publisher: '看天下',
#                    created_year: '2005',
#                    cn_num: 'CN64-1057/C  ',
#                    issn: '9771673265324',
#                    pub_cycle: '旬刊',
#                    pub_period: '每月8、18、28日',
#                    year_issue: 36,
#                    per_price: 12,
#                    year_price: 432,
#                    page: 232,
#                    format: '16开',
#                    copy: 3,
#                    image: File.open(Rails.root + 'public/uploads/image/tx.jpeg'),
#                    description: '《vista 看天下》主要以政治、历史、社会（包括财经）为主要内，回顾精彩历史事件，报道和评论时政热点。也有关于文娱和日常生活常识及最新科技小发明介绍的文字，以及一些世界新闻趣图。《vista 看天下》的亮点主要是在于其对所陈诉的历史或政治事件十分客观，尽量让读者能以一个独立的观察者身份去省视一些事件，而不会受到撰稿者的主观感情左右，也就是说《vista 看天下》中所包含的撰稿者主观情绪很少。但对于一些主流道德观念所公认的事件评论，字词中也能感受到作者的讽刺，但仅仅只是一点，相较于一些报纸杂志不负责任地作一些偏激言论哗众取宠、不惜歪曲事实拿含混的字词误导读者来说，是相当难能可贵的。《vista 看天下》也不是一本因没有激烈言辞而显得很乏味的杂志，其向读者所展示的世界，正如其名字一样，能让人有透过这扇明窗一览天下的感觉。'
#                  }, {
#                    title: '空天力量杂志',
#                    publisher: '美国空军大学出版社（Air University Press）',
#                    original_name: 'Air & Space Power',
#                    issn: '1554-2505',
#                    copy: 1,
#                    image: File.open(Rails.root + 'public/uploads/image/kt.jpg'),
#                    description: '《空天力量杂志》的英文是“Air & Space Power Journal”（ASPJ），由美国空军大学出版社（Air University Press）出版。ASPJ 既是美国空军的专业学术杂志，也是全世界空天力量开展对话的主要论坛，在美国和全球军界享有崇高声誉。ASPJ 除英文版之外，已先后推出西班牙文、葡萄牙文、阿拉伯文、法文及中文（简体）共五种语言版本，每种语言版本都有自己的特点和独特内容，由通晓本土语言及文化的编辑组稿。ASPJ 英文版以美国空军和世界各地有英语阅读能力的军事学者为主要读者，以开拓思维，促进专业交流为主旨。ASPJ 的其他语言版本亦本着相同目的，努力满��拉丁美洲、非洲、中东地区、亚洲和欧洲的空海陆军人���专业需求。'
# }, {
#   title: '',
#   management: '',
#   editor: '',
#   publisher: '',
#   created_year: '',
#   cn_num: '',
#   issn: '',
#   pub_cycle: '周刊',
#   pub_period: '每星期一',
#   year_issue: '52',
#   per_price: 15,
#   year_price: 780,
#   page: 168,
#   copy: 1,
#   description: ''
# }])

# unless User.exists?(email: 'admin@example.com')
#   User.create!(email: 'admin@example.com',
#                username: 'admin',
#                cname: '管理员',
#                password: '12345678',
#                is_admin: true)
# end
#
# unless User.exists?(email: 'editor@example.com')
#   User.create!(email: 'editor@example.com',
#                username: 'editor',
#                cname: '编辑',
#                password: '12345678',
#                is_admin: false)
# end
#
# unless User.exists?(email: 'user@example.com')
#   User.create!(email: 'user@example.com',
#                username: 'user',
#                cname: '普通用户',
#                password: '12345678',
#                is_admin: false)
# end
#
# unless User.exists?(email: 'book@example.com')
#   User.create!(email: 'book@example.com',
#                username: 'book',
#                cname: '图书管理员',
#                password: '12345678',
#                is_admin: true)
# end
#
# unless User.exists?(email: 'journal@example.com')
#   User.create!(email: 'journal@example.com',
#                username: 'journal',
#                cname: '资料管理员',
#                password: '12345678',
#                is_admin: true)
# end
#
# departments = %w[人力资源部 企划部 销售部 研发部 测试部 维修部]
# departments.each do |d|
#   next if Department.exists?(name: d)
#
#   Department.create!(name: d)
# end
#
# names = %w[参考消息 人民日报 半月谈 环球时报 红旗 参考要闻
#            国际先驱导报 解放军报 瞭望周刊 经��参考报]
# shortnames = %w[CKXX RMRB BYT HQSB HQ CKYW GJXQ JFJB LWZK JJCK]
# int_array = [1, 7, 15, 30]
# units = %w[人力资源部 企划部 销售部 研发部 测试部 维修部 总裁办]
# des = %w[经济建设取得重大成就 全面深化改革取得重大突破
#          民主法治建设迈出重大步伐 思想文化建设取得重大进展
#          人民生活不断改善 生态文明建设成效显著 ���������军兴军开创新局面
#          港澳台工作取得新进展 全方位外交布局深入展开 全面从严治党成效卓著]
#
# names.each do |name|
#   next if Journal.exists?(name: name)
#
#   Journal.create!(name: name,
#                   publisher: name + '杂志社',
#                   interval: int_array[rand(0..3)],
#                   shortname: shortnames[names.index(name)],
#                   amount: rand(1..16),
#                   delivery: units.sample(rand(1..5)).join(' '),
#                   description: des[rand(0..9)])
# end
#
# unless State.exists?
#   State.create(name: '新来', color: '#0066CC', default: true)
#   State.create(name: '借出', color: '#008000')
#   State.create(name: '可借', color: '#990000')
#   State.create(name: '重要', color: '#663399')
#   State.create(name: '在馆', color: '#990000')
# end
#
# docs = %w[高德地图发布年度报告济南蝉联“首堵之城”
#           上海检察：“套路贷”案件受害人多为有房族
#           经济建设取得重大成就
#           全面深化改革取得重大突破
#           内银前景获唱好
#           港股攻顶无难度
#           民主法治建设迈出重大步伐
#           思想文化建设取得重大进展
#           美国政治传统的回光返照
#           人民生活不断改善
#           生态文明建设成效显著
#           强军兴军开创新局面
#           墨西哥和中美洲地区
#           港澳台工作取得新进展
#           全方位��交布局深入展开
#           全面���严治党成效卓著
#           玉米神头像
#           特朗普主义用19世纪药方治21世纪美国沉疴
#           右翼的新自由主义思潮
#           古代玛雅文明的研究
#           推动��全球化所引起的���作用
#           特朗普主�����意味着极端保守主义势力的崛起
#           洪都拉斯西部的科潘以其杰出的雕刻艺术而闻名
#           神秘的玛雅文明与中华文明的关系
#           “美人之美”，要靠一手研究
#           中国削减钢材产量和全球供应持续增加
#           澳拟增加高品位铁矿石产量
#           建立三维数字化模型的方法极大地提高了工作效率和精度
#           澳拟增加高品位铁矿石产量
#           东京为外国人举行防灾演习 东京都返家困难人员对策条例 中国自主品牌汽车进入古巴市场
#           地球南北，何以冰火两重天 俄罗斯打开“东大门”助远东起飞 向18国公民开放电子签证
#           推“超前发展区”引海外投资 俄联邦政府赋予远东的优��政策前所未有 从���域项目到跨境互动
#           中俄两国政府对俄远东和中国东��地区合作的支持力度前所未有 远东投资的机会前所未有
#           哈萨克斯坦一辆大客车起火致52人死亡 特朗普缺席驻英新使馆开馆仪式 时间还没有敲定
#           英美“特殊关系”受考验 特朗普接受了访英之邀 印尼高度重视发展对华友好关系和务实合作
#           “向���红03”船抵达��甸开��海洋科学考察 中缅之间的科技合作 加拿大发行狗年生肖邮票
#           做半岛局势转圜的持续推动者
#           朝韩就朝方参加平昌冬奥会多项事宜达成一致
#           首届中国体育庙会大年初一亮相三亚
#           汕头大学四女生划艇横渡大西洋并打破世界纪录
#           2018马来西亚羽毛球大师��
#           中国花样���冰协会成立
#           双人滑奥运冠军申雪出任主席
#           深圳获国际女子网球协会年终总决赛10年举办权
#           擦亮冰面上���老北京
#           什刹海冰场举办首届华北区冰上���动会
#           王蔷朱琳出局
#           冰雪之王全国总决赛落幕
#           丁俊晖梁文博止步斯诺克大师赛首轮
#           国际奥委会主席巴赫向中国人民拜年
#           促进农民体育再上台阶
#           深圳队大胜山��队
#           竞技场需要���样的执拗
#           女冰小花悄然绽放
#           顺丰速运中欧班��双向对开
#           美加贸���关系紧张加��
#           德国央行将人民币资产纳入外汇储备
#           国际油���前景难料
#           英国火车票涨价，上班族很受伤
#           石油行业开启新一轮周期（经���透视）
#           德国���生一起严重交通事故致48人受伤
#           全球掀起假新闻“阻击战”（环球走笔）
#           利���亚首都机场附近发生武装冲突
#           突尼斯出台措施回应民生诉求
#           联合国机构强调将继续为巴勒斯坦难民服务
#           暂停承认以色列国?既往协议不再有效
#           西方政策立场无助于解决国际热点问题
#           中国发展经验��得学习
#           美国试图在叙利亚保持长期军事存在
#           精神��粮送到田间地头
#           农村公路养护不可忽视
#           光伏扶贫要做成良心工程
#           力促西北实现大开放大发展
#           让老年生活既安全又有尊严
#           让群众求助更精准 农民工讨薪热线覆盖全部地市
#           阿里拟起诉首批一百名售假者
#           半年发现1179件公益诉讼线索
#           推进民族统计工作法制化规范化
#           刹住不诚信，公证才公正
#           “三同”产品国内销售额超1000亿
#           海南实行跨市县闲置资金调剂
#           农民专业合作社5年新增近11万家
#           服务实体经济，保险大有可为
#           苏州用保险撬动企业融资
#           创新举措增添动能
#           谱写乡村振兴新篇章
#           各族群众共享健康红包
#           配网改到位用电质量高
#           56个民族儿女寄语十九大
#           电力供应足?农村发展好
#           进军营，包饺子
#           全国妇联十一���七次执委会议在京召开
#           一批涉儿童色情信息案件被严查
#           思政课更活，获得感更多
#           深化对中国特色社会主义政治经济学的研究
#           加快制造业服务化转型
#           大就要有大���样子
#           关于我国经济高质量发展的几点认识
#           钟扬的“种子精神”
#           心有敬畏 行有所止
#           解决立法实践中的突出问题
#           产业+旅游 脱贫有劲头
#           善行应该“落在脚下”
#           强化“一以贯之”的定力
#           电子盗版
#           为教育均等化不懈努力
#           让房���产回归“住人”的商品属性
#           使���是方向，问题是导向
#           签发首批外国高端人才确认函
#           智造升级
#           开展文化科技卫生“三下乡���
#           流动党员有了家
#           《中央军委巡视工作条例》印发
#           涵养研究问题的能力
#           更好满足新时代人民群众的精神文化需求
#           为推进强国兴军作出新���更大贡献
#           王毅将出席中拉论坛第二届部长级会议并访问
#           王毅会见加蓬总统邦戈
#           中土合作天然碱加工及配套电站项目投产运行
#           杨洁篪会见韩国国会议员代��团
#           一篇产生深刻国际影响的演讲
#           惟创新者强
#           开放的中国，带给世界更多机遇
#           非理性对外投资得到有效遏制
#           “兰州合肥成都等地调控松绑”系误读
#           冰雪那达慕
#           预警声中查污染
#           人民日报社与雄安新区合作共建雄安媒体中心
#           打好防范化解重大金融风险攻坚战
#           我国去年利用外���规���创�����高
#           亚投行运营两周年
#           全国统战部长会议在京召开
#           以习近平新时代中国特色社会主义思想.
#           俞正声与加蓬参议长米勒布举行会谈
#           习近平主席新年贺词
#           做一颗扎根大地的种子
#           铭记���辉历史?不忘初心使命
#           艺术的归途在时代生活
#           中国电影需要更多冷峻影评家
#           瀚海之谊，由来已久
#           ���俄之间，相连的不��是山水
#           皮皮虾“铁拳”有助于开发航天材料
#           极端酷暑侵袭澳大利亚
#           印尼排查公共建筑安全隐患
#           国际储能与创新联盟成立
#           中美知识产权学者对话举行
#           药贵顽疾困扰美国
#           如果可可树消失了
#           美国进入流感高峰期
#           美国称已冻结6500万美元对巴勒斯坦援助
#           中国海军第二十七批护航编队访问突尼斯
#           古特雷斯称赞中国应对气候变化的行动
#           老旧铁路换新颜
#           “一带一路提供开创性思路”
#           时代催人进，合作正当时
#           祝福送给港大校长
#           麻油鸡里的台湾味道
#           台最苛“劳基法”引爆民怨
#           公器私用，选举算计何时休
#           香港学校：大声讲出爱国爱港
#           这里的乡村美在哪
#           从经典出发，读点古诗词
#           书店也是图书馆
#           实体书店回来了
#           “随车员”变成“导航员”
#           读书是大学生活的底色
#           “亲其师”方能“信其道”
#           学科建设彰显“中国效应”
#           提升中国在国际学术组织中的影响力
#           如此“托教”有违师德
#           塑造面向未来的教育
#           以文物看文明?以文明扬自信（深聚焦）
#           英足坛诞生首粒视频助理裁判改判进球
#           中国车手遭遇事故被迫退赛
#           段莹莹张帅止步女单第二轮
#           马来西亚羽毛球大师赛?林丹李宗���首���出局
#           山东将举办首届冬��全民健身运动会
#           争锋
#           影响力不止于赛场
#           滑雪?南方照样玩得转
#           网络消费热点何以成槽点
#           当心！抢票“神器”偷你信息
#           谁“刷”热了虚高榜单
#           用信息平台防止“填表脱贫”
#           广西建厕所配建门面房
#           去年12月航班正常率88.33%
#           6项措施激励安全生产守信
#           工地上办起购票“培训班”
#           集众智破谣言
#           切实发挥民政在脱贫攻坚战中的兜底保障作用
#           国博举办张大千艺术展
#           六个月，我就会说中国话了
#           北京海淀今年将增6800个幼儿园学位
#           中科院将与卢森堡共建深空探测研究实验室
#           ���秧歌?学非遗
#           学长进���堂?思政有妙方
#           公共图书馆?走心＋出新
#           湘潭经开区政务服务提速
#           广东社会组织党建驶入快车道
#           广西八类暴力犯罪继续下降
#           扎彩龙，迎新春
#           甘肃去年为两百余万贫困人口免费体检
#           食品安全工作履职不力党政负责人共同担责
#           加大食药领域公���诉����案件办理力���
#           夫妻共同债务?认定有了新规
#           厦门海关启动海关信用评估系统
#           报告称70后、80后是网络消费主力军
#           北部湾经济区建设南向通道枢纽
#           去年全国发行地方政府债券43581亿
#           三季接羔好处多
#           重庆脱贫攻坚重质量
#           大力实施乡村振兴战略  
#           对破坏海洋行为“零容���”
#           净水设备进校园
#           我国出台最严围填海管控措施
#           评职称，就要评出称职的人
#           打赢脱贫攻坚战的有益参考
#           对我国社会主要矛盾认识的误区
#           中国思想理论进入世界的鲜亮标志
#           实现中华民族伟大复兴的必由之路
#           种菜靠技术?致富有支部
#           有信心有能力推动两岸关系克难前行
#           规范源头才能治理对头
#           大兴治污记
#           三无保健品，专盯老年人
#           根治校园欺凌，惩���关爱需并重
#           以法治共���呵护警民关系
#           把银行业风险锁进笼���
#           坚持“少数”“多数”的辩证法
#           种地的老黄爱发明
#           2017年���国71644人受处理
#           大力营造积极健康的社会文化环境
#           党性修养当“以���为败”
#           坚定不移���进军队全面从严治党
#           推动公共图书馆事业在法治轨道上取得新进展
#           美财长有意访华，中方表��欢迎
#           美国持续施压或使日本软化贸易立场
#           美施压踢走华为澳出资���海底光缆
#           美财长有意访华，中方表示欢迎
#           美财长拟访中，解贸易难题
#           中方欢迎美财长来����商中美贸易对话大门微微开启
#           在美施压下调整策略传日不排斥FTA
#           中美贸易摩擦欧盟称中立
#           杨苏棣证实，���陆战队将进驻AIT内湖新���]
# tags = %w[测试 任务 工作 学习 生活 人物]
# status = %w[available lend]
# level = %w[open internal sensitive secret classified]
# docs.each do |doc|
#   next if Doc.exists?(name: doc)
#
#   Doc.create(name: doc,
#              journal_id: rand(1..10),
#              origin: rand(1..100),
#              description: doc,
#              amount: rand(1..5),
#              tag_names: tags.sample(rand(1..5)).join(' '),
#              editor_id: rand(1..3),
#              receive: Faker::Date.backward(100),
#              publish: Faker::Date.backward(120),
#              created_at: Faker::Date.backward(80),
#              status: status[rand(0..1)],
#              level: level[rand(0..2)])
# end

# depts = Department.all
#
# docs.each do |doc|
#   if doc.amount.presence? && doc.amount > 0
#     doc.departments = depts.sample(doc.amount)
#     doc.save
#   end
# end
