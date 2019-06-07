--Tomas Giannini
--June 5, 2019
--Gun armory database

----------------------------------------------------------------
function verifyPassword()
  
  print('Enter your password: ')
  io.read()
  local code = io.read()
  local count = 1
  
  while code ~= password do
    
   print('Invalid password. Try again.')
   code = io.read()
   count = count + 1
   
  if count == 3 then
     print('Too many failed attempts\n')
     os.exit()
  end
    
  end
  
end

----------------------------------------------------------------
function addgun()
  
  verifyPassword()
  
  --Enter gun
  print('Enter gun')
  gun = io.read()
  
  --Find availabe spot in armory
  gunspot = 1
  repeat
    position =  armory[gunspot]
    gunspot = gunspot + 1

until position == nil

armory[(gunspot-1)] = gun
--armory[(gunspot-1)] = (gunspot-1)..'. ' .. gun

--go back to menu
menu()

end

----------------------------------------------------------------
function deletegun()
  
  verifyPassword()
  
  --view list and select gun to delete
  for i = 1, #armory do
    print(i .. '. ' .. armory[i].."\n")
  end
  
  print('\nWhich gun would you like to delete?')
  choice = io.read()
  
  for i = 1, #armory do 
    
    if choice == armory[i] then
      armory[i] = 'EMPTY'
      print('\nGun deleted')
  
      --go back to menu
      menu()
    end
  end
  
  print('Gun not found. Try again')
  deletegun()
end

----------------------------------------------------------------
function view()
  
  --view list
  for i = 1, #armory do
    print(i .. '. ' .. armory[i].."\n")
  end
  
  --go back to menu
  print('\nPress 0 to go back to menu')
  choice = io.read("*n")
  if choice == 0 then
    menu()
  else
    os.exit()
  end
end

----------------------------------------------------------------
function equip()
  
  if equipped == 0 then
    print('No guns in armory to equip')
    menu()
  end
  
  for i = 1, #armory do
    print(i .. '. ' .. armory[i].."\n")
  end
  
  print('Which gun would you like to equip?')
  io.read()
  equipgun = io.read()
  
  for i = 1, #armory do 
    
    if equipgun == armory[i] then
      
      print(equipgun.. ' is equipped')
      equippped = 1
      
      --go back to menu
      menu()
      
    end
  end
  
  print('Gun not found. Try again')
  equip()
  
end

----------------------------------------------------------------
function menu()
  
print('\n1. Add gun \n 2. Delete gun \n 3. View Armory \n 4. Equip \n 5. Exit')
choice = io.read("*n")

if choice == 1 then
  addgun()
  
elseif choice == 2 then
  deletegun()
  
elseif choice == 3 then
  view()
  
elseif choice == 4 then
  equip();
  
elseif choice == 5 then
  os.exit();
  
end
end

----------------------------------------------------------------
--Menu that starts off running the program

--PASSWORD CREATION
trigger = 1

while trigger == 1 do
  
trigger = 0

print('\nCreate your password: ')
password = io.read()

print('Confirm your password: ')
conpassword = io.read()

if password ~= conpassword then
  
  print('Passwords do not match')
  trigger = 1
  
end
end



armory = {}
equipped = 0

print('\n1. Add gun \n 2. Delete gun \n 3. View Armory \n 4. Equip \n 5. Exit')
choice = io.read("*n")

if choice == 1 then
  addgun()
  
elseif choice == 2 then
  deletegun()
  
elseif choice == 3 then
  view()
  
elseif choice == 4 then
  equip()
  
elseif choice == 5 then
  os.exit()
  end