import React, { useState } from 'react';
import { Skeleton, Card, Avatar, Col, Row, Tooltip, Popconfirm, message } from 'antd';
import { EyeFilled, CopyFilled } from '@ant-design/icons';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';
import _ from "lodash";

import { apiCollections, apiContains } from '../services/utilities/API'; 

const { Meta } = Card;

const key = 'updatable';

function CollectionCard(props) {

    const handleCollectionClone = (collection, profile) => {
        var count = 0;
        apiCollections.post({
            collection_type: "Cloned",
            is_private: false,
            count: collection.count,
            description: collection.description,
            collection_name: `${profile.username}'s ${collection.collection_name} collection`,
            owner: props.user_id,
        }).then(cloneRes => {
            apiContains.getAll()
                .then(res => {
                    res.data.filter(contain => {
                        if(contain.collection === collection.id) {
                            count = count + 1;
                            apiContains.post({
                                collection: cloneRes.data.id,
                                book: contain.book,
                            })
                        }
                    })
                })
            cloneCollectionSuccess();
        }).catch(err => {
            console.log(err);
        })
    }

    const cloneCollectionSuccess = () => {
        message.loading({ content: 'Processing...', key });
            setTimeout(() => {
                message.success({ content: 'Collection cloned successfully! Find it in your collection list!', key, duration: 2 });
            }, 1000);
    };

    return (
        <div style={{ marginLeft: 210, position: 'relative', bottom: 40 }}>
            <Row gutter={16}>
                {
                    _.zipWith(props.collections, props.profiles, function (collection, profile) {
                        if (profile && collection) {
                            return (
                                <Col span={4.5}>
                                    <Card
                                        headStyle={{ background: `linear-gradient(#3a7bd5 , #3a6073)`, color: 'white' }}
                                        bodyStyle={{ height: 120, color: 'black', background: `linear-gradient(#eacda3 , #d6ae7b)` }}
                                        style={{ color: 'black', background: '#cfcdc6' }}
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
                                            <Tooltip title="View Collection"><Link to={{ pathname: "/books", state: { publicAccess: true, collectionID: collection.id, profile: profile } }}><EyeFilled key="view" /></Link></Tooltip>,
                                            <Popconfirm 
                                                title="Do you want to add this collection to your collection list?"
                                                okText="Yes"
                                                cancelText="No"
                                                onConfirm={() => handleCollectionClone(collection, profile)}
                                            ><CopyFilled/>
                                            </Popconfirm>,
                                        ]}

                                    >
                                        <Meta
                                            // @mwang - i've passed in the appropriate profile object through to your component (Account.js) using the 'to' parameter of <Link/>.
                                            // To access it within your component, simple do "props.location.state.profile"
                                            description={profile ? <p style={{ color: 'black' }}>Compiled By: <Link to={{ pathname: "/accounts", state: { profile: profile } }}>{profile.username}<Tooltip text="View profile"></Tooltip></Link></p> : null}
                                        />
                                        {collection.description}
                                    </Card>
                                </Col>
                            )
                        }
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