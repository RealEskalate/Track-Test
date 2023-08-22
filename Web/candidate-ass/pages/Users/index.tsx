import { UserDetail } from '@/components/user/UserDetail'
import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { any } from 'cypress/types/bluebird';
import Link from 'next/link';


type User = {
  title: string;
  body: string;
};
const Users = () => {
  const [users, setUsers] = useState<User[]>([]);

  useEffect(() => {
    axios.get('https://jsonplaceholder.typicode.com/posts')
      .then(response => {
        setUsers(response.data);
      })
      .catch(error => {
        console.log(error);
      });
  }, []);

 return(
  <Link href= "/UserDetail">
      <h1><b>Candidates</b></h1>
      {users.map(user => (
        <div key={users[0].title}>
          {user.title}
        </div>
      ))}
     </Link>
  
 )
      }
/*<div>
    {users[0].name}
  </div> */
export default Users;
