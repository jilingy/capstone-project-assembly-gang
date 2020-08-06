import React, { useState, useEffect } from 'react';
import { Button, Table, message, Spin, Typography, Input, Menu, Dropdown } from 'antd';
import { connect } from 'react-redux';
import { apiCollections , apiAccount } from '../services/utilities/API';
import CollectionCard from '../components/CollectionCard';
import Fade from 'react-reveal/Fade';

const key = 'updatable';
const { Search } = Input;

function PublicCollections(props) {

    const [publicCollections, setPublicCollections] = useState([]);
    const [profiles, setProfiles] = useState([]);
    const [loading, setLoading] = useState(true);
    
    const [filter, setFilter] = useState('Collection Name');
    const [cancel, setCancel] = useState(false);
    const [query, setQuery] = useState(undefined);

    const {Title} = Typography

    useEffect(() => {
        if(cancel === false) {
            setPublicCollections([]);
            setProfiles([]);
            getCollections();
        }
        execSearch();  
    } , [query])

    const handleSelectedFilter = (filter) => {
        var temp = filter.item.props.value;
        setFilter(temp);
    }

    const setSearchFlag = (inputQuery) => {
        setCancel(true);
        setQuery(inputQuery);
    }

    const cancelSearch = () => {
        setQuery(undefined);
        setCancel(false);
    }

    const emptySearchError = () => {
        message.loading({ content: 'Processing...', key });
            setTimeout(() => {
                message.error({ content: 'Oops! We need a query to help you search. Please provide a keyword to get started!', key, duration: 5 });
            }, 1000);
    };

    const emptySearchReturn = () => {
        message.loading({ content: 'Processing...', key });
            setTimeout(() => {
                message.error({ content: 'Oops! Looks like we didn\'t find anything matching your query! Try again!', key, duration: 5 });
            }, 1000);
    };

    const execSearch = () => {
        if(query) {
            var filtered = [];
            if(filter === "Collection Name") {
                var queryMod = ''
                var fieldMod = ''
                var filteredProfiles = [];
                filtered = publicCollections.filter(collection => {
                    queryMod = query.toLowerCase();
                    fieldMod = collection.collection_name.toLowerCase();
                    if(fieldMod.includes(queryMod)) {
                        filteredProfiles = profiles.filter(profile => {
                            if(profile.id === collection.owner) {
                                return profile;
                            }
                        })
                        return collection;
                    } else {
                        return null;
                    }
                })
            } else if(filter === "Username") {
                var queryMod = ''
                var fieldMod = ''
                var filteredProfiles = profiles.filter(profile => {
                    queryMod = query.toLowerCase();
                    fieldMod = profile.username.toLowerCase();
                    if(fieldMod.includes(queryMod)) {
                        filtered = publicCollections.filter(collection => {
                            if(profile.id === collection.owner) {
                                return collection;
                            }
                        })
                        return profile;
                    } else {
                        return null;
                    }
                })
            }
            if(filtered && !filtered.length) {
                emptySearchReturn();
            } else {
                setPublicCollections(filtered);
                setProfiles(filteredProfiles);
            }
        } else if(query === ''){
            emptySearchError();
        }
    }

    const getCollections = async () => {
        apiCollections.getAll()
            .then(res => {
                res.data.filter(collection => {
                    if(parseInt(props.user_id) !== parseInt(collection.owner)) {
                        if(collection.collection_type === "Named" && collection.is_private === false) {
                            apiAccount.getSingle(collection.owner)
                                .then(res => {
                                    updatePublicCollections(collection);
                                    updateProfiles(res.data);
                                })
                            return collection;
                        }
                    } 
                })
                setLoading(false);
            })
    }

    const updateProfiles = (profile) => {
        setProfiles(prevProfiles => [...prevProfiles , profile])
    }

    const updatePublicCollections = (collection) => {
        setPublicCollections(prevCollections => [...prevCollections, collection]);
    }

    const menu = (
        <Menu onClick={handleSelectedFilter}>
          <Menu.Item key="1" value="Username">
            Username
          </Menu.Item>
          <Menu.Item key="2" value="Collection Name">
            Collection Name
          </Menu.Item>
        </Menu>
      );

    return (
        <div>
            <div style= {{ height: 100, background: `linear-gradient(#283048 , #859398)`, border: '2px solid black'}}>
            <Fade cascade>
                <Title 
                    level={3} 
                    style={{
                        position: 'relative',
                        right: 640, 
                        fontSize: 50, 
                        color: 'white',
                        textAlign : "center", 
                        fontFamily:"Book Antiqua,Georgia,Times New Roman,serif" 
                    }}>Public Collections
                </Title>
                <p style={{ color: 'white', fontSize: 24, position: 'relative', bottom: 40, right: 585 }}>Find out what everyone else has compiled or...</p>
                <div style={{ 
                    position: 'relative',
                    width: 535, 
                    left: 520,
                    bottom: 90,
                }}>
                    <Search 
                        placeholder="Search collection by collection name or username..." 
                        onSearch={value => setSearchFlag(value)} 
                        enterButton 
                    />
                    <Dropdown.Button
                        style={{
                            position: 'relative',
                            left: 400,
                            bottom: 32,
                        }}
                        overlay={menu}  
                        type="primary"
                    > 
                        {filter ? filter : 'Filters'}
                    </Dropdown.Button>
                    <Button 
                        type={cancel ? "danger" : "primary"}
                        style={{
                            left: 410,
                            bottom: 32,
                        }}
                        onClick={cancelSearch}
                    >
                        Cancel
                    </Button>
                </div>
            </Fade>
            </div>
            <CollectionCard collections={publicCollections} profiles={profiles}/>
        </div>
    )
}

const mapStateToProps = state => {
    return {
        user_id: state.user_id,
    }
}

export default connect(mapStateToProps)(PublicCollections);