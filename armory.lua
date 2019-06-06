--Tomas Giannini
--June 5, 2019
--Gun armory database


function addgun()
  
  --Enter gun
  print('Enter gun')
  io.read()
  gun = io.read()
  
  --Find availabe spot in armory
  gunspot = 1
  repeat
    position =  armory[gunspot]
    gunspot = gunspot + 1

until position == nil

armory[(gunspot-1)] = (gunspot-1)..'. ' .. gun

--go back to menu
menu()

end


function deletegun()
  
  --view list and select gun to delete
  
  --BEFORE ARMORY
  for i = 1, #armory do
    print(armory[i].."\n")
  end
  print('Which gun would you like to delete? (enter number)')
  choice = io.read("*n")
  
  armory[choice] = nil
  
  --AFTER ARMORY
  for i = 1, #armory do
    print(armory[i].."\n")
  end
  
  --go back to menu
  menu()
  
  end


function view()
  
  --view list
  for i = 1, #armory do
    print(armory[i].."\n")
  end
  
  --go back to menu
  print('Press 0 to go back to menu')
  choice = io.read("*n")
  if choice == 0 then
    menu()
  else
    os.exit()
  end
end


function menu()
  
print('1. Add gun \n 2. Delete gun \n 3. View Armory \n 4. Exit')
choice = io.read("*n")

if choice == 1 then
  addgun()
  
elseif choice == 2 then
  deletegun()
  
elseif choice == 3 then
  view()
  
elseif choice == 4 then
  os.exit();
  
end
end


--Menu that starts off running the program
armory = {}
print('1. Add gun \n 2. Delete gun \n 3. View Armory \n 4. Exit')
choice = io.read("*n")

if choice == 1 then
  addgun()
  
elseif choice == 2 then
  deletegun()
  
elseif choice == 3 then
  view()
  
elseif choice == 4 then
  os.exit();
  
  end