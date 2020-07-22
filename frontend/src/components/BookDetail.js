import React, { useState, useEffect } from 'react';
import {Row,Col,Typography,Card ,Modal, Comment, Avatar, Pagination, IconText, List,TreeSelect } from 'antd';
import { MessageOutlined, LikeOutlined, StarOutlined } from '@ant-design/icons';
import BookCover from '..//images/book_cover.jpg';
//import axios from 'axios';
import { connect } from 'react-redux';

function BookDetail(props){

    const {Title, Text} = Typography

    const handleCancel = () => {
      props.updateVisible(!props.visible);
    };

    return(
      <div>
        <Modal
          title={null}
          visible={props.visible}
          footer={false}
          onCancel={handleCancel}
          mask={true}
          maskClosable={false}
          maskStyle ={{marginLeft:200, marginTop:60}}
          style ={{marginLeft:200,marginTop:-40}}
          bodyStyle={{height: 882}}
          width={1703}
        >
          <Row gutter={16}>
          <Col span={6}>
            <Card 
              style={{ width: 400, height: 400, background: '#cfcdc6'}}
              cover={<img alt="example" src={BookCover} />}
            />
          </Col>
          <Col span={9}>
          <Title>
              {props.book_title}
          </Title>
          
          <p><b>Synopsis:</b> {props.book_synopsis}</p>
          <p><b>Publisher:</b> {props.book_publisher}</p>
          <p><b>Date Published:</b> {props.publication_date}</p>
          <p><b>Genre:</b> {props.genre}</p>
          <p><b>Average Rating:</b> {props.average_rating}</p>
          </Col>
          <Col span={9}>
            <Title level={4}>Your Review</Title>
            <Comment
              //actions={actions}
              author={<a>Eric Shen</a>}
              avatar={
                <Avatar
                  src={BookCover}
                  alt="Han Solo"
                />
              }
            content={
              <p>
                This book fucking sucks
              </p>
            }
            />
            <Title level={4}>Other Reviews</Title>
            <List
              itemLayout="vertical"
              size="large"
              pagination={{
                showSizeChanger : false,
                total : 85,
                //showTotal : {(total, range) => `${range[0]}-${range[1]} of ${total} items`},
                pageSize : 5,
                defaultCurrent: 1,
                pageSize: 3,
              }}
              //dataSource={listData}
              renderItem={item => (
              <List.Item
                key={item.title}
                //actions={[
                  //<IconText icon={StarOutlined} text="156" key="list-vertical-star-o" />,
                  //<IconText icon={LikeOutlined} text="156" key="list-vertical-like-o" />,
                  //<IconText icon={MessageOutlined} text="2" key="list-vertical-message" />,
                //]}
                >
              <List.Item.Meta
                avatar={<Avatar src={BookCover} />}
                title={<a>Book sucks</a>}
                description={<a>Book hater</a>}
              />
                {<a>One of the worst books I have ever laid eyes on</a>}
              </List.Item>
              )}
          />
          </Col>
          </Row>
        </Modal>
      </div>
    )
}

const mapStateToProps = state => {
  return {
      user_id: state.user_id,
  }
}

export default connect(mapStateToProps)(BookDetail);