import React, { useState, useEffect } from 'react';
import { Button, Table, message, Spin, Typography } from 'antd';
import { connect } from 'react-redux';
import { apiCollections , apiAccount } from '../services/utilities/API';
import CollectionCard from '../components/CollectionCard';
import Fade from 'react-reveal/Fade';

function PublicCollections(props) {

    const [publicCollections, setPublicCollections] = useState();
    const [profiles, setProfiles] = useState([]);
    const [loading, setLoading] = useState(true);
    
    const {Title} = Typography

    useEffect(() => {
        getCollections();
    } , [])

    const getCollections = async () => {
        apiCollections.getAll()
            .then(res => {
                var filtered = res.data.filter(collection => {
                    if(parseInt(props.user_id) !== parseInt(collection.owner)) {
                        if(collection.collection_type === "Named" && collection.is_private === false) {
                            apiAccount.getSingle(collection.owner)
                                .then(res => {
                                    updateProfiles(res.data);
                                })
                            return collection;
                        }
                    } 
                })
                setPublicCollections(filtered);
                setLoading(false);
            })
    }

    const updateProfiles = (profile) => {
        setProfiles(prevProfiles => [...prevProfiles , profile])
    }

    return (
        <div>
            <div style= {{ height: 100, background: `linear-gradient(#283048 , #859398)`, border: '2px solid black'}}>
            <Fade cascade>
                    <Title 
                        level={3} 
                        style={{
                            position: 'relative',
                            right: 545, 
                            fontSize: 50, 
                            color: 'white',
                            textAlign : "center", 
                            fontFamily:"Book Antiqua,Georgia,Times New Roman,serif" 
                        }}>Public Collections
                    </Title>
                    <p style={{ color: 'white', fontSize: 24, position: 'relative', bottom: 40, right: 515 }}>Find out what everyone else has compiled</p>
                </Fade>
            </div>
            {loading ? null : <CollectionCard collections={publicCollections} profiles={profiles}/>}
        </div>
    )
}

const mapStateToProps = state => {
    return {
        user_id: state.user_id,
    }
}

export default connect(mapStateToProps)(PublicCollections);