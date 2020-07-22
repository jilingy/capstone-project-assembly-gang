import React, { useState, useEffect } from 'react';
import {Row,Col,Typography,Card ,Modal, Comment, Avatar, Empty , IconText, List } from 'antd';
import { MessageOutlined, LikeOutlined, StarOutlined } from '@ant-design/icons';
import BookCover from '..//images/book_cover.jpg';
//import axios from 'axios';
import { connect } from 'react-redux';
import { apiReviews } from '../services/utilities/API';

function BookDetail(props){

    const {Title, Text} = Typography

    const [reviews, setReviews] = useState([]);
    const [userReview, setUserReview] = useState();

    useEffect(() => {
      getReviews();
    }, []);

    /*useEffect(() => {
      getReviews();
    }, [reviews, bookReviews]);
    */
   
    const getReviews = () => {
      apiReviews.getAll()
      .then(res => {
          var filtered = res.data.filter(review => {
              if(parseInt(props.id) === review.book) {
                  return review;
              } else {
                  return null;
              }
          })
          var doubleFiltered = res.data.find(review => {
            if(parseInt(props.id) === review.book && parseInt(props.user_id) === review.user) {
                return review;
            } else {
                return null;
            }
          })
          setReviews(filtered);
          setUserReview(doubleFiltered);
      }).catch(err => {
          console.log(err);
      })
    }

    const handleCancel = () => {
      props.updateModalVisible(!props.visible);
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
            {userReview ? <Comment
              //actions={actions}
            author={<a>{userReview.rating}</a>}
              avatar={
                <Avatar
                  src={BookCover}
                  alt="Han Solo"
                />
              }
            content={
              <p>
                {userReview.review}
              </p>
            }
            /> :
            <Empty description = "You do not have a review yet">
            </Empty>
          }
            <Title level={4}>Other Reviews</Title>
            <List
              itemLayout="vertical"
              size="large"
              pagination={{
                showSizeChanger : false,
                total : reviews.length,
                //showTotal : {(total, range) => `${range[0]}-${range[1]} of ${total} items`},
                pageSize : 5,
                defaultCurrent: 1,
              }}
              dataSource={reviews}
              renderItem={item => (
              <List.Item
                key={item}
                //actions={[
                  //<IconText icon={LikeOutlined} text="156" key="list-vertical-like-o" />
                //]}
                >
              <List.Item.Meta
                avatar={<Avatar src={BookCover} />}
              />
                <Comment
              //actions={actions}
              author={<a>{item.user}<b>{item.rating}</b></a>}
              avatar={
                  <Avatar
                    src={BookCover}
                    alt="Han Solo"
                  />
                }
              content={item.review}
              datetime={item.date}
                />
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