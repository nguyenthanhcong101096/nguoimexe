App.status = App.cable.subscriptions.create "StatusChannel",
  received: (data) ->
    online_area = $('.active')
    myself      = online_area.attr('user_id')
    klass       = $("##{data['user_id']}")
    following   = $('.following').attr('following')
    
    online_offline(data, klass, online_area, myself, following)
    
online_offline = (data, klass, online_area, myself, following) ->
  if(data['key'] == 'online')
    # Kiểm tra nếu chính mình thì không hiện online
    if(myself != (data['user_id']))
      check_user_following_online(data, klass, following, online_area)
  else
    klass.remove()

check_user_following_online = (data, klass, following, online_area) ->
  arr_following = following.split(',')
  
  for i in [0...arr_following.length]
    # Kiểm tra user có được following hay không và nó đã hiện thị hay chưa
    if arr_following[i] == data['user_id'] && klass.attr('user') != data['user_id']
      online_area.append(data['html'])
