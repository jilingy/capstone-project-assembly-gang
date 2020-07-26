import React from 'react';
import { Skeleton, Card, Avatar,Col, Row, Tooltip } from 'antd';
import { EditOutlined, EllipsisOutlined, SettingOutlined, EyeFilled } from '@ant-design/icons';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';
import _ from "lodash";

const { Meta } = Card;

function CollectionCard(props) {

    return (
      <div style={{ marginLeft: 210, position: 'relative', bottom: 40 }}>
        <Row gutter={16}>
        {
            _.zipWith(props.collections, props.profiles, function(collection, profile) {
                return (
                    <Col span={4.5}>
                        <Card
                            headStyle={{ background: `linear-gradient(#3a7bd5 , #3a6073)`, color: 'white' }}
                            bodyStyle={{ color: 'white', background: 'black' }}
                            style={{ color: 'white', background: '#cfcdc6' }}
                            cover={
                                <img
                                    alt="example"
                                    src="https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/book-quotes-1531945007.jpg"
                                />
                            }
                            title={`${collection.collection_name}`}
                            bordered={true}
                            style={{ width: 300, marginTop: 50, border: '2px solid black' }}
                            actions={[
                                <Tooltip title="View Collection"><EyeFilled key="view"/></Tooltip>,
                                <EllipsisOutlined key="ellipsis" />,
                            ]}
                            
                        >
                            <Meta
                                description={ profile ?  <p style={{ color: 'white' }}>Compiled By: <Tooltip text="View profile"><Link>{profile.username}</Link></Tooltip></p>  : null}
                            />
                            {collection.description}
                        </Card>
                    </Col>
                )
            })
        }
        </Row>
      </div>
        
    )
}

const mapStateToProps = state => {
    return {
        user_id: state.user_id,
    }
}


export default connect(mapStateToProps)(CollectionCard);