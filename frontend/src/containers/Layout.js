import React from 'react';
import { Layout, Menu, Button } from 'antd';
import { Link } from 'react-router-dom';

import {
  HomeOutlined,
  BookOutlined,
} from '@ant-design/icons';

const { Header, Content, Sider } = Layout;

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
          <Link to="/col_list">My Book Collections</Link>
        </Menu.Item>
      </Menu>
    </Sider>
    <Layout className="site-layout" style={{ marginLeft: 200 }}>
      <Header className="site-layout-background" style={{ padding: 0 }}>
        <Menu theme="dark" mode="horizontal" defaultSelectedKeys={['2']}>
          <Button type="primary" style={{ left: 1420 }}><Link to="/register">Register</Link></Button>
          <Button type="primary" style={{ left: 1440}}><Link to="/login">Login</Link></Button>
          <Button type="primary" style={{ float: 'right', marginTop: 15, marginRight: 20, backgroundColor: '#FF5833', borderColor: '#FF5833' }}><Link to="/login">Logout</Link></Button>
          <Button type="primary" style={{ float: 'right', marginTop: 15, marginRight: 20 }}><Link to="/account">Account</Link></Button>
        </Menu>
      </Header>
      <Content style={{ margin: '24px 16px 0', overflow: 'initial' }}>
        <div className="site-layout-background" style={{ padding: 24, textAlign: 'center' }}>
          {props.children}
        </div>
      </Content>
    </Layout>
  </Layout>
  )
}