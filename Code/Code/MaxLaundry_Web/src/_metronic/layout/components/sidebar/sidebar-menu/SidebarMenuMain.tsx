import { useIntl } from 'react-intl'
import { KTIcon } from '../../../../helpers'
import { SidebarMenuItemWithSub } from './SidebarMenuItemWithSub'
import { SidebarMenuItem } from './SidebarMenuItem'

const SidebarMenuMain = () => {
  const intl = useIntl()

  return (
    <>
      <SidebarMenuItem to='/dashboard' icon='element-11'
        title={intl.formatMessage({ id: 'MENU.DASHBOARD' })} fontIcon='bi-app-indicator' />

      <SidebarMenuItemWithSub to='/crafted/widgets' title='Setup' icon='educare' fontIcon='bi-layers'>
        <SidebarMenuItem to='/crafted/widgets/lists' title='Manage Roles' hasBullet={true} />
        <SidebarMenuItem to='/crafted/widgets/lists' title='Manage Users' hasBullet={true} />
        <SidebarMenuItem to='/crafted/widgets/lists' title='Manage Companies' hasBullet={true} />
        <SidebarMenuItem to='/crafted/widgets/lists' title='Garment Types' hasBullet={true} />
        <SidebarMenuItem to='/crafted/widgets/lists' title='Manage Customers' hasBullet={true} />
        <SidebarMenuItem to='/crafted/widgets/lists' title='Application Settings' hasBullet={true} />
        <SidebarMenuItem to='/crafted/widgets/lists' title='Garment Category' hasBullet={true} />
        <SidebarMenuItem to='/crafted/widgets/lists' title='Manage Locations' hasBullet={true} />
        <SidebarMenuItem to='/crafted/widgets/lists' title='Manage Readers' hasBullet={true} />
        <SidebarMenuItem to='/crafted/widgets/lists' title='Manage Contracts' hasBullet={true} />
        <SidebarMenuItem to='/crafted/widgets/statistics' title='Promotions' hasBullet={true} />
      </SidebarMenuItemWithSub>

      <SidebarMenuItemWithSub to='/crafted/widgets' title='Transaction' icon='educare' fontIcon='bi-layers'>
        <SidebarMenuItem to='/crafted/widgets/lists' title='Recieve Clothes' hasBullet={true} />
        <SidebarMenuItem to='/crafted/widgets/statistics' title='Tag Items' hasBullet={true} />
        <SidebarMenuItem to='/crafted/widgets/statistics' title='Order List' hasBullet={true} />
        <SidebarMenuItem to='/crafted/widgets/statistics' title='Transfer In' hasBullet={true} />
        <SidebarMenuItem to='/crafted/widgets/statistics' title='Transfer Out' hasBullet={true} />
        <SidebarMenuItem to='/crafted/widgets/statistics' title='Sort By Services' hasBullet={true} />
        <SidebarMenuItem to='/crafted/widgets/statistics' title='Sort By Locations' hasBullet={true} />
        <SidebarMenuItem to='/crafted/widgets/statistics' title='Pack Clothes' hasBullet={true} />
        <SidebarMenuItem to='/crafted/widgets/statistics' title='Deliver Clothes' hasBullet={true} />
        <SidebarMenuItem to='/crafted/widgets/statistics' title='Settle Payment' hasBullet={true} />
        <SidebarMenuItem to='/crafted/widgets/statistics' title='cancel order' hasBullet={true} />
        <SidebarMenuItem to='/crafted/widgets/statistics' title='Manual Transfer' hasBullet={true} />
        <SidebarMenuItem to='/crafted/widgets/statistics' title='Read Tags' hasBullet={true} />
      </SidebarMenuItemWithSub>

      <SidebarMenuItemWithSub to='/crafted/widgets' title='Reports' icon='educare' fontIcon='bi-layers'>
        <SidebarMenuItem to='/crafted/widgets/lists' title='Reports' hasBullet={true} />
        <SidebarMenuItem to='/crafted/widgets/statistics' title='View Discrepencies' hasBullet={true} />
        <SidebarMenuItem to='/crafted/widgets/lists' title='Excel Reports' hasBullet={true} />
      </SidebarMenuItemWithSub>
    </>
  )
}

export { SidebarMenuMain }
