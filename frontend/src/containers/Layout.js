import React from 'react';
import { Input, Layout, Menu, Button } from 'antd';
import { Link } from 'react-router-dom';

import {
  HomeOutlined,
  BookOutlined,
} from '@ant-design/icons';

const { Header, Content, Footer, Sider } = Layout;
const { Search } = Input;

export default function CustomLayout(props) {

  return (
    <Layout>
    <Sider
      style={{
        overflow: 'auto',
        height: '100vh',
        position: 'fixed',
        left: 0,
      }}
    >
      <div className="logo" />
      <Menu theme="dark" mode="inline" defaultSelectedKeys={['1']}>
        <Menu.Item key="1" icon={<HomeOutlined />}>
          <Link to="/">Home</Link>
        </Menu.Item>
        <Menu.Item key="2" icon={<BookOutlined />}>
        <Link to="/books">Main Collection</Link>
        </Menu.Item>
      </Menu>
    </Sider>
    <Layout className="site-layout" style={{ marginLeft: 200 }}>
      <Header className="site-layout-background" style={{ padding: 0 }}>
        <Menu theme="dark" mode="horizontal" defaultSelectedKeys={['2']}>
          <Button type="primary" style={{ left: 1615 }}><Link to="/logout">Logout</Link></Button>
            <Search 
            placeholder="Search book by title, author, genre..." 
            onSearch={value => console.log(value)} 
            enterButton 
            style={{ 
              width: 535, 
              position: 'relative', 
              top: 17, 
              right: 70
            }}/>
        </Menu>
      </Header>
      <Content style={{ margin: '24px 16px 0', overflow: 'initial' }}>
        <div className="site-layout-background" style={{ padding: 24, textAlign: 'center' }}>
          {props.children}
        </div>
      </Content>
      <Footer style={{ textAlign: 'center' }}>Ant Design ©2018 Created by Ant UED</Footer>
    </Layout>
  </Layout>
  )
}